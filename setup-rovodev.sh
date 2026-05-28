#!/bin/bash
#
# PM Copilot for Rovo Dev - Setup Script (Linux / macOS / WSL)
#
# This script is designed to be run from the PM-Copilot repository.
# It will copy the .rovodev configuration into your actual product working directory.
#
# Usage:
#   cd /path/to/PM-Copilot
#   chmod +x setup-rovodev.sh
#   ./setup-rovodev.sh
#

set -e

echo "================================================================"
echo "  PM Copilot - Multi-Platform Setup"
echo "================================================================"
echo ""
echo "This script installs PM Copilot (skills, context, memory, AGENTS.md) into your actual product project."
echo "It supports Rovo Dev and Grok as primary platforms."
echo ""

# Get the directory where this script lives (the PM-Copilot repo)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Ask which platform to install for
echo "Which platform are you installing PM Copilot for?"
echo "  1) Rovo Dev (creates .rovodev/)"
echo "  2) Grok (creates .grok/ and recommends the Grok plugin)"
echo ""
read -rp "Enter 1 or 2 [default: 2]: " PLATFORM_CHOICE
PLATFORM_CHOICE=${PLATFORM_CHOICE:-2}

if [ "$PLATFORM_CHOICE" = "1" ]; then
    PLATFORM="rovodev"
    SOURCE_DIR="$SCRIPT_DIR/.rovodev"
    TARGET_SUBDIR=".rovodev"
    echo "Installing for Rovo Dev..."
else
    PLATFORM="grok"
    SOURCE_DIR="$SCRIPT_DIR/.grok"
    TARGET_SUBDIR=".grok"
    echo "Installing for Grok (plugin recommended as primary method)..."
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Could not find $SOURCE_DIR folder next to this script."
    echo "Please run this script from inside the PM-Copilot repository."
    exit 1
fi

# Ask user for their project directory
echo "Please enter the full path to the project directory where you want to use PM Copilot."
echo "Example: /home/yourname/projects/my-product or ~/code/my-product"
echo ""
read -rp "Target project directory: " TARGET_DIR

# Expand ~ if present
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

if [ ! -d "$TARGET_DIR" ]; then
    echo ""
    echo "ERROR: Directory does not exist: $TARGET_DIR"
    echo "Please create it first or enter a valid path."
    exit 1
fi

echo ""
echo "Target directory: $TARGET_DIR"
echo ""

# Check if target folder already exists
TARGET_FOLDER="$TARGET_DIR/$TARGET_SUBDIR"
if [ -d "$TARGET_FOLDER" ]; then
    echo ""
    echo "⚠️  WARNING: A $TARGET_SUBDIR folder already exists in the target directory."
    echo "    Proceeding will PERMANENTLY DELETE the existing configuration"
    echo "    (including any custom memory, context, or modifications you have made)."
    echo ""
    BACKUP_NAME="$TARGET_DIR/$TARGET_SUBDIR.backup.$(date +%Y%m%d-%H%M%S)"
    echo "    Recommended: Manually back up first:"
    echo "    cp -r \"$TARGET_FOLDER\" \"$BACKUP_NAME\""
    echo ""
    echo "    To proceed with deletion and overwrite, type the word OVERWRITE and press Enter."
    echo ""
    read -rp "Type OVERWRITE to continue, or anything else to abort: " CONFIRM
    echo
    if [ "$CONFIRM" != "OVERWRITE" ]; then
        echo "Aborted. Existing $TARGET_SUBDIR was left untouched."
        exit 0
    fi
    echo "Removing existing $TARGET_SUBDIR..."
    rm -rf "$TARGET_FOLDER"
fi

# Copy configuration into the target project
echo "Copying $TARGET_SUBDIR configuration into your project..."
cp -r "$SOURCE_DIR" "$TARGET_FOLDER"

echo "Done copying $TARGET_SUBDIR."
echo ""

# Change into the target directory
echo "Changing to your project directory..."
cd "$TARGET_DIR"

echo ""
echo "================================================================"
echo "  Running initial memory setup for this project"
echo "================================================================"
echo ""
echo "Rovo Dev will now analyze this project to build context."
echo "You can also run this manually later with: /memory init"
echo ""

# Try to run memory init
if command -v acli &> /dev/null; then
    acli rovodev run "/memory init" || echo "Note: You can run '/memory init' manually after starting Rovo Dev."
else
    echo "Note: 'acli' command not found in PATH. You will need to run '/memory init' manually inside Rovo Dev."
fi

echo ""
echo "================================================================"
echo "  Optional: Install skills globally (user level)"
echo "================================================================"
echo ""
echo "You can also make some PM Copilot skills available in ALL your projects"
echo "by copying them to your personal Rovo Dev folder (~/.rovodev)."
echo ""
read -rp "Copy skills + subagents to ~/.rovodev for use across all projects? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mkdir -p "$HOME/.rovodev/skills"
    mkdir -p "$HOME/.rovodev/subagents"

    echo "Copying skills to user level..."
    cp -r .rovodev/skills/* "$HOME/.rovodev/skills/" 2>/dev/null || true

    echo "Copying subagents to user level..."
    cp -r .rovodev/subagents/* "$HOME/.rovodev/subagents/" 2>/dev/null || true

    echo "User-level installation complete."
fi

echo ""
echo "================================================================"
echo "  Setup Complete!"
echo "================================================================"
echo ""
echo "Next steps:"
echo ""
echo "  1. Make sure you are in your project directory:"
echo "     cd $TARGET_DIR"
echo ""
if [ "$PLATFORM" = "grok" ]; then
    echo "  2. Recommended: Install the Grok plugin from the plugins/grok-pm-copilot/ folder."
    echo "     (Alternatively, the .grok folder has already been copied to your project.)"
    echo ""
    echo "  3. Start Grok in your project directory and type:"
    echo "     Run PM Copilot onboarding"
else
    echo "  2. Start Rovo Dev:"
    echo "     acli rovodev run"
    echo ""
    echo "  3. Inside Rovo Dev, type:"
    echo "     Run PM Copilot onboarding"
fi
echo ""
echo "     Or try: Brief me"
echo ""
echo "You can re-run this setup script anytime from the PM-Copilot repo"
echo "to update another project."
echo ""
echo "================================================================"