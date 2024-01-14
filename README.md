# Colorify
Toolkit for Minecraft BE

## Usage
- Android

Download release `app-release.apk`, install and grant its io permission

Files will be generated under `/storage/emulated/0/Documents/`

- Windows

Download release `Windows-Release.zip` and unzip it to your preferred location

Open `colorify.exe`, files will be generated under `C:\Users\your_name\Documents\colorify`

## Build
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

## Features
- Generates particle paintings from images
- Generates block paintings from images
- Automatically create `.mcpack` file for conveniently importing
- Generates scripts for conveniently invoking

## TODO
- Generates QRCode
- (Batch) Execute command format transformation