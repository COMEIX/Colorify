# Colorify
Toolkit for Minecraft BE

I am refactoring and upgrading this app, so there won't be any update for a long time.

## Warning
For unknown reasons, the app is incompatible with HarmonyOS.

For Functior(Old version of Colorify), there's no compatibility problem with HarmonyOS. So I guess is that some update to the Flutter SDK caused this problem.

## Usage
- Android

Download release `app-release.apk`, install and grant its io permission

Files will be generated under `/storage/emulated/0/Documents/`

- Windows

Download release `Windows-Release.zip` and unzip it to your preferred location

Open `colorify.exe`, files will be generated under `C:\Users\your_name\Documents\colorify`

## Build
Clone project to your computer
```
git clone https://github.com/COMEIX/Colorify.git
```

Before building, you need to install project dependencies, try
```
flutter pub get
```

Then, build with platform argument according to your needs 
- Android
```
flutter build apk --target-platform android-arm64
```
- Windows
```
flutter build windows
```
- iOS/MacOS

Not supported
- Linux

Not supported

Actually, Flutter supports almost all platforms, but I do not have any Apple/Linux device, so I cannot promise the compatibility.

## Features
- Generates particle paintings from images
- Generates block paintings from images
- Automatically create `.mcpack` file for conveniently importing
- Generates scripts for conveniently invoking

## Upcoming features
- ~~.bdx support~~

Due to some reasons, .BDX file won't be supported.
- Custom palette for both block paintings and particle paintings
- WebSocket support for block painting
- Stair type block paintings
- (?) Dithering for block paintings
- (?) level.dat reader
- QR code generator
- Better UI/UX, and unique UI for all supported platforms