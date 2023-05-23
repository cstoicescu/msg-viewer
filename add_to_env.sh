#!/bin/bash

# Define the path to the msg-opener files
MSG_OPENER_PATH="C:/Users/Catalin/Desktop/GitHub/MsgOpener"

# Define the msgview alias based on the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    MSGVIEW_ALIAS="msgviewer-linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    MSGVIEW_ALIAS="msgviewer-macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    MSGVIEW_ALIAS="msgviewer-win.exe"
else
    echo "Unsupported operating system."
    exit 1
fi

# Normalize the path for Windows if running in Git Bash
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    MSG_OPENER_PATH=$(cygpath -m "$MSG_OPENER_PATH")
fi

# Check if the entries already exist in the .bash_profile
if grep -Fxq "# Add 'msgviewer' files to PATH" "$HOME/.bash_profile" && grep -Fxq "export PATH=\"\$PATH:$MSG_OPENER_PATH\"" "$HOME/.bash_profile" && grep -Fxq "alias msgview=\"$MSGVIEW_ALIAS\"" "$HOME/.bash_profile"; then
    echo "The entries already exist in .bash_profile."
else
    # Append the entries to the .bash_profile
    printf "\n# Add 'msgviewer' files to PATH\n" >> "$HOME/.bash_profile"
    printf "export PATH=\"\$PATH:$MSG_OPENER_PATH\"\n" >> "$HOME/.bash_profile"
    printf "alias msgview=\"$MSGVIEW_ALIAS\"\n" >> "$HOME/.bash_profile"
    echo "Updated .bash_profile with the necessary entries."
fi

# Check if the msgviewer path is already added to the PATH for CMD
if echo "%PATH%" | grep -q "$MSG_OPENER_PATH"; then
    echo "The msgviewer path is already added to the PATH for CMD."
else
    # Add the msgviewer path to the PATH for CMD
    setx PATH "%PATH%;$MSG_OPENER_PATH"
    echo "Updated PATH environment variable for CMD."
fi

echo "Please restart Git Bash and CMD to apply the changes."
