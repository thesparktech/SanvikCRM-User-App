
# SanvikSystem - Flutter Shopping UI Kit
> version 1.0.0


SanvikSystem is a nicely designed and developed mobile application shopping UI kit developed using Flutter. Flutter is an open-source mobile application development SDK created by Google and used to develop applications for Android and iOS.

SanvikSystem makes an easy job for a developer to have the modern look and feel in the mobile application. It saves lots of hustle and time to develop a nicely design UI for modern shopping mobile application. SanvikSystem is ready to use and can be easily integrated in any flutter project. The code organization is easy to understand any part can be taken out and added into flutter application.

SanvikSystem comes with around 60+ screens covering many use cases with 3 layouts. It comes with both light and dark theme and works great with both android and ios.


### Features

* 3 Different Layout
* 60+ Screens
* Light - Dark mode
* Multi language

### Layout 
* Login
* Register
* Reset Password
* Home
* Search
* Cart
* Product
* Checkout
* Payment
* Address
* Profile
* Review
* Rating

### Other Screens

* Onboarding
* Filter
* Sort
* Maintenance
* Chats
* Empty Cart
* Add Card
* Page not found
* No internet
* Sold out
* Mega menu
* FAQ


### Project Structure

```
...
   ├── layout x/  # This folder contains many different layout x folders, each of which corresponds to a different layout of the app.
   ├── screens/   # This folder contains many different screens of the app.
   ├── utils/     # This folder contains all utilities of the app.
   └── main.dart  # Root file of the project
```

## Project Setup

In order to set up the project, please follow below steps:

### Flutter setup

1. Install package dependencies:
```
flutter pub get
```
2. Run the project by running command:
```
flutter run
```
3. Use one of these commands to build the project:
```
flutter build ios
flutter build apk
flutter build appbundle
```

4. If any issue (run the below command to troubleshoot):
```
flutter doctor
```


#### Google map setup

1. To use Google Maps in your Flutter app, you need to configure an API project with the [Google Maps Platform](https://cloud.google.com/maps-platform/), following both the [Maps SDK for Android's Get API key](https://developers.google.com/maps/documentation/android-sdk/get-api-key), and [Maps SDK for iOS' Get API key](https://developers.google.com/maps/documentation/ios-sdk/get-api-key) processes. With API keys in hand, carry out the following steps to configure both Android and iOS applications.
2. To add an API key to the Android app, edit the ```AndroidManifest.xml``` file in ```android/app/src/main```. Add a single meta-data entry containing the API key created in the previous step.
3. To add an API key to the iOS app, edit the ```AppDelegate.swift``` file in ```ios/Runner```. Unlike Android, adding an API key on iOS requires changes to the source code of the Runner app. The AppDelegate is the core singleton that is part of the app initialization process.

4. [For more on google map](https://codelabs.developers.google.com/codelabs/google-maps-in-flutter/#3)


For help getting started with Flutter, check [online documentation](https://flutter.dev/docs), which offers great tutorials, samples, guidance on mobile development, and a full API reference. If you run into any issue or question, feel free to reach out to us via email support@coderthemes.com

### Flutter packages used in SanvikSystem:

* shared_preferences
* provider
* cupertino_icons
* material_design_icons_flutter
* google_fonts
* google_maps_flutter
