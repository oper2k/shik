Link to the mobile application code - https://github.com/oper2k/shik

Link to the code for the web admin - https://github.com/oper2k/shikadmin

Structure of projects (both projects are similar in structure):

Folders:

Android/ - contains settings, source code and resources specific to the Android platform. Here are editable files AnroidManifest.xml and build.gradle, as well as the resource folder res (which, for example, will contain the icon of the Android application in different resolutions)

Assets/ - This folder contains static resources necessary for the application, such as images, fonts and audio files.

Ios/ - this folder is very similar to the android folder, with the difference that it contains files specific to the iOS platform: settings, source code and resources. If you need to add an iOS-specific one.

Lib/ - it is in this directory that the main work on writing code is carried out. Initially, there is only the main.dart file inside, which contains the main function - the entry point to our application.

Test/ - code related to automatic testing will be added to this folder.

Pubspec.lock is an automatically generated file based on the .yaml file. It contains detailed information about all dependencies.

Pubspec.yaml is the configuration file of the project. Here the dependencies required by the project are announced, the necessary fonts are connected and assets are connected (pictures, icons, audio files, etc.).

The main folder of the lib/ project has subfolders:

Auth - everything related to user authorization in the application

Backend - everything related to the database connection

Components - there are components that we wrote ourselves, which are used in the application (widgets)

Courses - files and folders related to the courses section. Screen layout, logic.

Flutter_flow - there are components that we took from the FF library (video player, map, audio player), as well as functions and animations.

Game/piano - files and folders related to the game/quiz section. At the moment, one piano game is available. Screen layout, logic.

Map_folder - files and folders related to the map section. Screen layout, logic.

News - files and folders related to the news section. Screen layout, logic.

Profile - files and folders related to the user profile section. Screen layout, logic.

Registration - files and folders related to the registration section. Screen layout, logic.

Route - files and folders related to the user route section. Screen layout, logic.

App_state.dart - local variables and related functions
