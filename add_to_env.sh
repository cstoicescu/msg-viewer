#!/bin/bash

# Define the path to the msg-opener files
MSG_OPENER_PATH="/c/Users/Catalin/Desktop/GitHub/MsgOpener"

# Define the msgview alias based on the operating system
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    MSGVIEW_ALIAS="msg-opener-linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    MSGVIEW_ALIAS="msg-opener-macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    MSGVIEW_ALIAS="msg-opener-win.exe"
else
    echo "Unsupported operating system."
    exit 1
fi

# Check if the entries already exist in the .bash_profile
if grep -Fxq "# Add 'msg-opener' files to PATH" ~/.bash_profile && grep -Fxq "export PATH=\"\$PATH:$MSG_OPENER_PATH\"" ~/.bash_profile && grep -Fxq "alias msgview=\"$MSGVIEW_ALIAS\"" ~/.bash_profile; then
    echo "The entries already exist in .bash_profile."
else
    # Append the entries to the .bash_profile
    echo "" >> ~/.bash_profile
    echo "# Add 'msg-opener' files to PATH" >> ~/.bash_profile
    echo "export PATH=\"\$PATH:$MSG_OPENER_PATH\"" >> ~/.bash_profile
    echo "alias msgview=\"$MSGVIEW_ALIAS\"" >> ~/.bash_profile
    echo "Updated .bash_profile with the necessary entries."
fi

# Reload the .bash_profile
source ~/.bash_profile
