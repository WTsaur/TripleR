# TripleR
### Developed by **WORM**

## What is TripleR?
A police misconduct reporting platform iOS app for users to share their experiences and encounters with police by recording important details and evidence of these encounters in a secure, encrypted database. The goal of this app is to provide users a “Report” function that requests information essential to accurate local officer misconduct reports such as officer name, description, vehicle number, witness information, and event description so that a report can be filed more accurately in each community. There will also be a “Record” function that captures events like traffic stops on video or audio, depending on the user's needs. The record functionality is user dependent (user controls if and what the app is recording). Finally, we aim to provide a “Rights” page that lists users’ rights when they are stopped or in tense situations with police. As the scope of law changes drastically in different states, the primary focus will be national laws upheld in Florida as well as state specific law that may aid a person's speech when encountering an officer.

## How to Clone to your computer & Run TripleR on your device (iPhone/iPad)
* Make sure your iOS device is updated to at least iOS 14. The project does not support arm64 (Apple's M1 silicon chip) as of yet.
* Make sure you have **CocoaPods** installed: sudo gem install cocoapods
1. Clone the git respository
2. Open up a terminal and cd into the TripleR folder that contains a folder called Pods
3. Run the command: pod install
4. Open the Xcode file called "TripleR.xcworkspace"
5. Connect your mobile device (iPhone/iPad) to your computer and select your device in the top left to the right of "TripleR"
6. Unlock your device
7. Run the project or use the shortcut cmd+R (if this is your first time running the application the process will take some time as it builds the project and sets up your phone)
8. If Xcode gives an error saying that it "Could not launch TripleR", navigate to your device's Settings -> General -> Device Management -> Apple Development ->    Trust
9. You can now open the application on your device

![Home Page](https://github.com/WTsaur/TripleR/blob/master/docImages/homePage.png)

## Features

### Settings
    * See that status of the app's permissions to your device's hardware (Camera, Microphone, Location, Photo Library)
    * Enable/disable special application features
![Settings Page](https://github.com/WTsaur/TripleR/blob/master/docImages/settingsPage.jpg)
### Record
    * Record videos with your main camera and save them to your photo library
![Record View](https://github.com/WTsaur/TripleR/blob/master/docImages/recordView.jpg)
### Report
    * Fill out a form and attach a video to it to submit to our database of reports
![Report Page](https://github.com/WTsaur/TripleR/blob/master/docImages/reportPage.jpg)
![Report Section](https://github.com/WTsaur/TripleR/blob/master/docImages/reportSection.jpg)
### Rights
    * Learn about the rights that you have including state (Florida) specific rights as well as tips for dealing with encounters with the police
![Rights Page](https://github.com/WTsaur/TripleR/blob/master/docImages/rightsPage.jpg)
![Rights Section](https://github.com/WTsaur/TripleR/blob/master/docImages/rightsSection.jpg)

## Credits

#### Melissa Ma

- GUI design and implementation

#### Orlando Lewis

- API & Database, GUI design

#### Rachael Scott

- App Logo & GUI design, API & Database

#### William Tsaur

- GUI design and implementation
