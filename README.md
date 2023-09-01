# Rick and Morty APP

_The present repository is an implementation and use of the RickAndMortyAPI (https://rickandmortyapi.com/)_

## Start 🚀

For run this project you need to download this repo:

### Pre-requisites 📋

_What things do you need to install the software and how to install them:_

- Install Flutter on your machine: https://docs.flutter.dev/get-started/install. It's important to follow all the steps depending on the machine you are using. It's preferable to use a Mac so that the application can be tested on both iOS and Android.

- Set up an editor: https://docs.flutter.dev/get-started/editor. We recommend using VSCode.

### Installation 🔧

_Steps for debug the app_

0. Copy the api_keys.example.json, an create a file with the name api_keys.json, and add this: rickandmortyapi.com, I made this for security porposes

1. Check that the Flutter version is 3.13.1 or similar compatible

2. Run this command

```
flutter pub get
```

3. Run this commands (only for MAC)

```
cd ios
pod cache clean --all
pod repo update
pod install
pod update
```

4. Run and IOS or Android Emulator and play the debug mode

#### If you are using VSCODE and running the "run and debug" command:

_In the .vscode folder, you will find different launch configurations for the app_

#### For other text editors, please refer to these documents:

- Flutter documentation for Android Studio: https://docs.flutter.dev/tools/android-studio#running-and-debugging
- Android documentation for configuring different builds: https://developer.android.com/studio/run/rundebugconfig

## Builds 📦

#### Android

1. Run:

   If you want an apk file

```
fvm flutter build apk --release --dart-define-from-file=api_keys.json --obfuscate --split-debug-info=../
```

2. Run:

   If you want a bundle file

```
fvm flutter build appbundle --release --dart-define-from-file=api_keys.json --obfuscate --split-debug-info=../
```

#### IOS (Only works MAC)

2. Ejecutar:

```
fvm flutter build ipa --release --dart-define-from-file=api_keys.json --obfuscate --split-debug-info=../
```

## Built with

- Flutter 3.13.1
- Dart 3.1.0

_Libraries used in the project_

### Dependencies

- [http](https://pub.dev/packages/http): A package for making HTTP requests, essential for fetch the api data.
- [json_annotation](https://pub.dev/packages/json_annotation): A package for automatically generating JSON serialization code for your Dart classes. It simplifies the process of converting JSON data to Dart objects and vice versa.
- [bloc](https://pub.dev/packages/bloc): For create the state for the pagination in the app
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): For provide the blocs in the app
- [equatable](https://pub.dev/packages/equatable): For implement equalities in classes (used mostly for the bloc states)
- [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination): For manage the infinite scroll, and refresh of the data
- [google_fonts](https://pub.dev/packages/google_fonts): Use for give an special font in the app

- [json_serializable](https://pub.dev/packages/google_fonts): For create the fromJson in models data
- [build_runner](https://pub.dev/packages/google_fonts): Used for run the json_serializable commands

## Authors ✒️

- **Jairo Andrés Portela Cortés**
