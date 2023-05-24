#!/bin/bash

# Get the directory path where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Determine the operating system
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    # Windows
    FILE_PATH="$SCRIPT_DIR/msgviewer-win.exe"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    FILE_PATH="$SCRIPT_DIR/msgviewer-linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    FILE_PATH="$SCRIPT_DIR/msgviewer-macos"
else
    echo "Unsupported operating system."
    exit 1
fi

# Add the file path to the PATH in .bash_profile
echo "export PATH=\"\$PATH:$FILE_PATH\"" >> "$HOME/.bash_profile"

# Add an alias for convenience
echo "alias msgview=\"$FILE_PATH\"" >> "$HOME/.bash_profile"

# Print a success message
echo "The file '$FILE_PATH' has been added to the PATH in .bash_profile."
echo "An alias 'msgview' has been added as well."
