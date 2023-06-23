# MSG Viewer

MSG Viewer is a command-line tool that allows you to open and extract the contents of Outlook .msg files on macOS and Windows.

## Features

- Extracts email metadata such as subject, sender, recipients, and body.
- Downloads attachments from the email and saves them locally.
- Generates an HTML file that displays the email content and attachments in a readable format.

# PICS 
![1](https://github.com/cstoicescu/msg-viewer/assets/53979557/e6b4e4b8-621f-46d4-988a-ee8d1348c491) 
 
![2](https://github.com/cstoicescu/msg-viewer/assets/53979557/1700c5cc-330b-4d09-914e-3adb0311c767) 


## Usage: use source code(1), or bundled app (2) 

## Use source code (1)


1. In order to use sources files, you make sure you have Node.js installed on your machine. You can download it from the official Node.js website: [https://nodejs.org](https://nodejs.org)

2. Clone this repository or download the source code as a ZIP file.

3. Open a command prompt or terminal and navigate to the project directory.

4. Run the following command to install the required dependencies: **npm install** 

5. To use MSG Opener, run the following command in the terminal:



- ### Windows
node .\openmsg.js .\<email-name>.msg

 - ### MacOs
node ./openmsg.js <email-name>.msg



The tool will extract the email contents, save any attachments to a folder named "out", and generate an HTML file displaying the email details.

## Usage bundled app 
Based on your OS use one of the following executables:
msgviewer-linux
msgviewer-macos
msgviewer-win.exe

Example: ./msgviewer-win.exe  ./email-name.msg

### Optional (can be skipped)

Add any of the builded variants on your %PATH% env as alias
Use add_to_env.sh 

Steps: 
1. Open a terminal and navigate to the directory where you saved the script.
2. Run the following command to execute the script:

    ```bash
    bash add_to_env.sh
    ```
        OR 
    ``` cmd
    msgviewer-win.exe my_file.msg
    ```

   This will update your `.bash_profile` file with the necessary entries and reload it.

3. Verify that the update was successful by running the following commands in your terminal:

    ```bash
    echo $PATH
    ```

   You should see the `MsgOpener` directory included in the output, indicating that it has been added to your PATH.

4. You can now use the `msgview` command followed by a file name to open `.msg` files using the `msgviewer` tool. For example:

    ```bash
    msgview my_file.msg
    ```
      OR 
    ``` cmd
    msgviewer-win.exe my_file.msg
    ```
    
   This will open the specified `.msg` file using the `msgviewer` tool.


## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

MSG Opener uses the [MsgReader](https://www.npmjs.com/package/@kenjiuno/msgreader) library by Kenji Uno for reading .msg files.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

