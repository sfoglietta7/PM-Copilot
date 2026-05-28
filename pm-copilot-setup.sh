#!/bin/bash
#
# PM Copilot - Multi-Platform Setup Script (Linux / macOS / WSL)
#
# Usage:
#   cd /path/to/PM-Copilot
#   chmod +x pm-copilot-setup.sh
#   ./pm-copilot-setup.sh
#

set -e

echo "================================================================"
echo "  PM Copilot - Multi-Platform Setup"
echo "================================================================"
echo ""

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Which platform are you installing PM Copilot for?"
echo "  1) Rovo Dev"
echo "  2) Grok (recommended: install the Grok plugin)"
echo ""
read -rp "Enter 1 or 2 [default: 2]: " PLATFORM_CHOICE
PLATFORM_CHOICE=${PLATFORM_CHOICE:-2}

if [ "$PLATFORM_CHOICE" = "1" ]; then
    PLATFORM="rovodev"
    SOURCE_DIR="$SCRIPT_DIR/.rovodev"
    TARGET_SUBDIR=".rovodev"
    echo "Installing Rovo Dev configuration..."
else
    PLATFORM="grok"
    echo "Grok selected."

    # Always prepare to copy the .grok folder
    SOURCE_DIR="$SCRIPT_DIR/.grok"
    TARGET_SUBDIR=".grok"

    echo ""
    echo "Grok Plugin Installation"
    echo "Would you like to also install the official PM Copilot Grok plugin?"
    echo "  1) Yes – User level (recommended)"
    echo "  2) Yes – Project level"
    echo "  3) No – Only copy the .grok/ folder"
    echo ""
    read -rp "Enter 1, 2 or 3 [default: 1]: " GROK_PLUGIN_CHOICE
    GROK_PLUGIN_CHOICE=${GROK_PLUGIN_CHOICE:-1}

    if [ "$GROK_PLUGIN_CHOICE" = "1" ]; then
        PLUGIN_TARGET="$HOME/.grok/plugins/pm-copilot"
        INSTALL_PLUGIN=true
        echo "Will install Grok plugin to user level."
    elif [ "$GROK_PLUGIN_CHOICE" = "2" ]; then
        INSTALL_PLUGIN=true
        INSTALL_PLUGIN_PROJECT=true
        echo "Will install Grok plugin at project level (after target directory is chosen)."
    else
        echo "Will only copy the .grok/ folder (no plugin)."
    fi
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "ERROR: Required source directory not found next to this script."
    exit 1
fi

echo ""
read -rp "Enter the full path to your project directory: " TARGET_DIR
TARGET_DIR="${TARGET_DIR/#\~/$HOME}"

if [ ! -d "$TARGET_DIR" ]; then
    echo "ERROR: Directory does not exist: $TARGET_DIR"
    exit 1
fi

# Handle project-level Grok plugin
if [ "$INSTALL_PLUGIN_PROJECT" = true ]; then
    PLUGIN_TARGET="$TARGET_DIR/.grok/plugins/pm-copilot"
fi

# Copy main config
TARGET_FOLDER="$TARGET_DIR/$TARGET_SUBDIR"

# Critical safety guard: Never allow deletion of the project root itself
if [ "$TARGET_FOLDER" = "$TARGET_DIR" ] || [ -z "$TARGET_SUBDIR" ]; then
    echo ""
    echo "CRITICAL SAFETY ABORT:"
    echo "The script detected an attempt to target the project root directory itself for deletion."
    echo "This is not allowed and has been blocked to protect your files."
    echo ""
    echo "TargetDir: $TARGET_DIR"
    echo "TargetSubdir: '$TARGET_SUBDIR'"
    echo ""
    echo "Please report this as a bug. No files were deleted."
    exit 1
fi

if [ -d "$TARGET_FOLDER" ]; then
    echo ""
    echo "WARNING: $TARGET_SUBDIR already exists."
    read -rp "Type OVERWRITE to replace it: " CONFIRM
    if [ "$CONFIRM" != "OVERWRITE" ]; then
        echo "Aborted."
        exit 0
    fi
    rm -rf "$TARGET_FOLDER"
fi

echo "Copying configuration..."
cp -r "$SOURCE_DIR" "$TARGET_FOLDER"
echo "Done copying $TARGET_SUBDIR."

# Install Grok plugin if chosen
if [ "$INSTALL_PLUGIN" = true ] && [ -d "$SCRIPT_DIR/plugins/grok-pm-copilot" ]; then
    mkdir -p "$PLUGIN_TARGET"
    echo "Installing Grok plugin to $PLUGIN_TARGET..."
    cp -r "$SCRIPT_DIR/plugins/grok-pm-copilot/"* "$PLUGIN_TARGET/"
    echo "Grok plugin installed successfully!"
fi

cd "$TARGET_DIR"

echo ""
echo "================================================================"
echo "Setup Complete!"
echo "================================================================"
echo ""
echo "Next steps:"
echo "  cd $TARGET_DIR"
echo ""

if [ "$PLATFORM" = "grok" ]; then
    echo "  Start Grok and run:"
    echo "    Run PM Copilot onboarding"
else
    echo "  Start Rovo Dev:"
    echo "    acli rovodev run"
    echo "  Then run:"
    echo "    Run PM Copilot onboarding"
fi

echo ""
echo "================================================================"