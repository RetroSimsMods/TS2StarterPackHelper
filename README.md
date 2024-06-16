# TS2 Starter Pack Helper

<img width="60" height="60" src="https://github.com/RetroSimsMods/TS2StarterPackHelper/blob/main/img/Icon.png" alt="TS2 Starter Pack Helper Icon">

TS2 Starter Pack Helper will automatically download the required files for [osab's Standalone (Offline) Installer](https://github.com/voicemxil/TS2-Starter-Pack/) for local storage and installation. An internet connection is only required for the initial download. 

After downloading the files, this Helper can automatically extract and copy files to the default TS2 Starter Pack installation folder by checking 'Install Starter Pack Files'. Choose this option before using the Offline Installer. 

Credit: Large portions of code in this Helper are based on osab's Installer and modified where needed. Thank you for making this awesome tool!


## How To Use

<img width="60" height="60" src="https://github.com/RetroSimsMods/TS2StarterPackHelper/blob/main/img/Icon.png" alt="TS2 Starter Pack Helper Icon"> [Download the latest release from here](https://github.com/RetroSimsMods/TS2StarterPackHelper/releases/)

Put the application into a desired folder and run it. Choose the destination folder, and then select the components. By default, it will only download the files. 

For the initial download, the Helper will keep the files inside of the directory 'TS2StarterPackFiles'. This will take up about 4.8 GB of storage space. You'll be able to store the installer and files on your system, or on an external device.

By checking the 'Install' option, the application will extract the files to the chosen folder. Use this option before installing the Ultimate Collection using osab's Offline Installer.


## Building From Source

TS2 Starter Pack Helper is compiled using [this Unofficial NSIS build by negrutiu](https://github.com/negrutiu/nsis). It can build 64-bit installers, and also contains the dependencies for the ModernXL theme and NSCurl (required for this installer). 

Download the Nsis7z plugin and extract it to the NSIS plugins folder. I needed to move the file from x64-unicode to amd64-unicode for the 64-bit build to work.

Now open up NSIS, click 'Compile NSI scripts', open \src\TS2SPHelper.nsi and compile it. The resulting binary will be in the \bin\ folder. 

Enjoy!