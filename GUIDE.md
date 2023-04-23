## Development

### Run (macOS)

<!-- #### supabase (docker)

```bash
open -a Docker && ping -i 120 -c 2 google.com > /dev/null && cd ./src/api && docker-compose up -d && cd ../..
``` -->
<!-- 
#### flutter -->

```bash
cd ./src/ui/ && flutter create . && flutter run
```

### Configuring

#### Networking permissions

[https://docs.flutter.dev/development/data-and-backend/networking#platform-notes](https://docs.flutter.dev/development/data-and-backend/networking#platform-notes)

#### Rename app

```bash
flutter pub global activate rename
cd ./src/ui && flutter pub global run rename --appname "medicamina" && flutter pub global run rename --bundleId com.medicamina.ui
flutter clean
flutter pub get
```

#### iOS

##### ./src/ui/ios/Runner/info.plist

```xml
	<key>CFBundleDisplayName</key>
	<string>medicamina</string>
	<key>CFBundleName</key>
	<string>medicamina</string>
```

#### macOS

##### ./src/ui/macos/Podfile

```C
post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_macos_build_settings(target)
    target.build_configurations.each do |config|
      config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.15'
    end
  end
end
```

```bash
flutter clean
flutter pub get
cd ./src/ui/macos && pod install
```

### android

#### ./src/ui/android/app/src/main/AndroidManifest.xml

```xml
<manifest ...> 
  <uses-permission android:name="android.permission.INTERNET"/>
  <application ... />
</mainfest>
```