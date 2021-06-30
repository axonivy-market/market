Axon Ivy's **SFTP Connector** helps you to accelerate process automation initiatives by integrating secure file transfer into your process work. With this SFTP client you can easily transfer files securely to and from a remote computer. This connector:

* uses the SFTP protocol
* is based on JSch [http://www.jcraft.com/jsch/] to handle the SFTP Connections and Operations
* is a pure Java implementation of SSH2
* allows you to connect to an sshd server and use port forwarding, X11 forwarding, file transfer, etc.
* makes it easy to integrate secure file transfer into your process work


## Demo

1. Click on **File to Upload** and select one file from your local directory.

   ![Upload-File](doc/images/Upload-File.PNG)

   Path: Sftp/SftpUploadFile -> uploadFile(fileToBeUploaded, filename)

   Description: this operation will upload the file to the root path on the server.

   Parameters: 

               - fileToBeUploaded -> the file to upload as java.io.InputStream

               - filename -> the file name as String


2. Click on **Refresh** to list all the files on the remote directory.

   - Select one file from the list and click on **Download**.

   ![Download-File](doc/images/Download-File.PNG)

   Path: Sftp/SftpDownloadFile -> downloadFile(remoteFileName) Result: toFile

   Description: this operation will download the file from the server.

   Parameters: 

               - remoteFileName -> the file name as String

   Result: 

               - toFile -> the File to download as java.io.File

The **SftpClientDemo** HTML Dialog contains all the final operations to upload, list and download the file from/to the SFTP Server.

   ![SftpClientDemo](doc/images/SftpClientDemo.PNG)

## Setup

Before starting the demo, please make sure to have an SSH/SFTP server on your computer (respective the computer you want to access). For testing, the following “Rebex Tiny SFTP Server (free)” was used.
Rebex Tiny SFTP Server (free): [https://www.rebex.net/tiny-sftp-server/]
Small, minimalist, single-user SFTP server for testing purposes, free for commercial and non-commercial use
1. Open the following settings in “RebexTinySftpServer.exe.config” with a text editor and update the following values:
   ![RebexTinySftpServer.exe.config](doc/images/RebexTinySftpServer.exe.config.PNG)

2. Open the `Configuration/variables.yaml` in your Designer and update the following global variables:

   ```
   
   Variables:

     com.axonivy.connector.sftp.server:
       # The host name to the SFTP server
       host: 'localhost'

       # The password to the SFTP server
       password: pwd

       # The port number to the SFTP server
       port: 22

       # The username to the SFTP server
       username: 'usr'

   ```

4. Save the changed settings.


### Prerequisites:

* Working **SFTP Server**.
* You will also need the correct Server host name and the port number.
