# clean_arch_project
A new brick that create template clean architecture project.

This brick was inspired by [Very Good Core](https://brickhub.dev/bricks/very_good_core/0.7.0#usage)


## What's Included ✨
Clean Arch Project includes:

- ✅ [Cross Platform Support][flutter_cross_platform_link] - Built-in support for iOS, Android, Web, and Windows (MacOS/Linux coming soon!)
- ✅ [Build Flavors][flutter_flavors_link] - Multiple flavor support for development, staging, and production
- ✅ [Sound Null-Safety][null_safety_link] - No more null-dereference exceptions at runtime. Develop with a sound, static type system.
- ✅ [Bloc][bloc_link] - Integrated bloc architecture for scalable, testable code which offers a clear separation between business logic and presentation
- ✅ [Logging][logging_link] - Built-in, extensible logging to capture uncaught Flutter and Dart Exceptions

## Dependencies
- bloc
- cached_network_image
- dio
- freezed_annotation
- json_annotation
- get_it
- flutter_cache_manager
- get_storage
- http_parser
- internet_connection_checker
- intl

## Dev Dependencies
- bloc_test
- build_runner
- freezed
- json_serializable
- mockito

## Usage 🚀
1. Create new brick
    ```
    mason make clean_arch_feature
    ```
2. Go to project that have been created
3. Generate all model freezed/json 
    ```
    flutter packages pub run build_runner build --delete-conflictiong-outputs
    ```
4. Run the project

## Output
```
.
|____macos
| |____Runner.xcworkspace
| | |____contents.xcworkspacedata
| | |____xcshareddata
| | | |____IDEWorkspaceChecks.plist
| |____RunnerTests
| | |____RunnerTests.swift
| |____Runner
| | |____Assets.xcassets
| | | |____AppIcon.appiconset
| | | | |____app_icon_16.png
| | | | |____app_icon_1024.png
| | | | |____app_icon_256.png
| | | | |____app_icon_64.png
| | | | |____app_icon_512.png
| | | | |____app_icon_128.png
| | | | |____Contents.json
| | | | |____app_icon_32.png
| | |____DebugProfile.entitlements
| | |____Base.lproj
| | | |____MainMenu.xib
| | |____MainFlutterWindow.swift
| | |____Configs
| | | |____AppInfo.xcconfig
| | | |____Debug.xcconfig
| | | |____Release.xcconfig
| | | |____Warnings.xcconfig
| | |____AppDelegate.swift
| | |____Info.plist
| | |____Release.entitlements
| |____Runner.xcodeproj
| | |____project.pbxproj
| | |____project.xcworkspace
| | | |____xcshareddata
| | | | |____IDEWorkspaceChecks.plist
| | |____xcshareddata
| | | |____xcschemes
| | | | |____Runner.xcscheme
| |____Flutter
| | |____Flutter-Debug.xcconfig
| | |____GeneratedPluginRegistrant.swift
| | |____Flutter-Release.xcconfig
| | |____ephemeral
| | | |____flutter_export_environment.sh
| | | |____Flutter-Generated.xcconfig
| |____.gitignore
| |____Podfile
|____test
| |____widget_test.dart
|____.metadata
|____web
| |____index.html
| |____favicon.png
| |____icons
| | |____Icon-192.png
| | |____Icon-maskable-192.png
| | |____Icon-maskable-512.png
| | |____Icon-512.png
| |____manifest.json
|____pubspec.lock
|____ios
| |____Runner.xcworkspace
| | |____contents.xcworkspacedata
| | |____xcshareddata
| | | |____IDEWorkspaceChecks.plist
| | | |____WorkspaceSettings.xcsettings
| |____RunnerTests
| | |____RunnerTests.swift
| |____Runner
| | |____Runner-Bridging-Header.h
| | |____Assets.xcassets
| | | |____LaunchImage.imageset
| | | | |____LaunchImage@2x.png
| | | | |____LaunchImage@3x.png
| | | | |____README.md
| | | | |____Contents.json
| | | | |____LaunchImage.png
| | | |____AppIcon.appiconset
| | | | |____Icon-App-76x76@2x.png
| | | | |____Icon-App-29x29@1x.png
| | | | |____Icon-App-40x40@1x.png
| | | | |____Icon-App-20x20@1x.png
| | | | |____Icon-App-1024x1024@1x.png
| | | | |____Icon-App-83.5x83.5@2x.png
| | | | |____Icon-App-20x20@3x.png
| | | | |____Contents.json
| | | | |____Icon-App-20x20@2x.png
| | | | |____Icon-App-29x29@3x.png
| | | | |____Icon-App-40x40@2x.png
| | | | |____Icon-App-60x60@3x.png
| | | | |____Icon-App-60x60@2x.png
| | | | |____Icon-App-76x76@1x.png
| | | | |____Icon-App-40x40@3x.png
| | | | |____Icon-App-29x29@2x.png
| | | |____AppIcon-dev.appiconset
| | | | |____Icon-App-76x76@2x.png
| | | | |____Icon-App-29x29@1x.png
| | | | |____Icon-App-40x40@1x.png
| | | | |____Icon-App-20x20@1x.png
| | | | |____Icon-App-1024x1024@1x.png
| | | | |____Icon-App-83.5x83.5@2x.png
| | | | |____Icon-App-20x20@3x.png
| | | | |____Contents.json
| | | | |____Icon-App-20x20@2x.png
| | | | |____Icon-App-29x29@3x.png
| | | | |____Icon-App-40x40@2x.png
| | | | |____Icon-App-60x60@3x.png
| | | | |____Icon-App-60x60@2x.png
| | | | |____Icon-App-76x76@1x.png
| | | | |____Icon-App-40x40@3x.png
| | | | |____Icon-App-29x29@2x.png
| | | |____AppIcon-stg.appiconset
| | | | |____Icon-App-76x76@2x.png
| | | | |____Icon-App-29x29@1x.png
| | | | |____Icon-App-40x40@1x.png
| | | | |____Icon-App-20x20@1x.png
| | | | |____Icon-App-1024x1024@1x.png
| | | | |____Icon-App-83.5x83.5@2x.png
| | | | |____Icon-App-20x20@3x.png
| | | | |____Contents.json
| | | | |____Icon-App-20x20@2x.png
| | | | |____Icon-App-29x29@3x.png
| | | | |____Icon-App-40x40@2x.png
| | | | |____Icon-App-60x60@3x.png
| | | | |____Icon-App-60x60@2x.png
| | | | |____Icon-App-76x76@1x.png
| | | | |____Icon-App-40x40@3x.png
| | | | |____Icon-App-29x29@2x.png
| | |____GeneratedPluginRegistrant.h
| | |____Base.lproj
| | | |____LaunchScreen.storyboard
| | | |____Main.storyboard
| | |____AppDelegate.swift
| | |____GeneratedPluginRegistrant.m
| | |____Info.plist
| |____Runner.xcodeproj
| | |____project.pbxproj
| | |____project.xcworkspace
| | | |____contents.xcworkspacedata
| | | |____xcshareddata
| | | | |____IDEWorkspaceChecks.plist
| | | | |____WorkspaceSettings.xcsettings
| | | | |____swiftpm
| | | | | |____configuration
| | |____xcshareddata
| | | |____xcschemes
| | | | |____development.xcscheme
| | | | |____production.xcscheme
| | | | |____Runner.xcscheme
| |____Flutter
| | |____flutter_export_environment.sh
| | |____Debug.xcconfig
| | |____Release.xcconfig
| | |____AppFrameworkInfo.plist
| | |____Generated.xcconfig
| |____.gitignore
| |____Podfile
|____README.md
|____pubspec.yaml
|____.gitignore
|____linux
| |____main.cc
| |____CMakeLists.txt
| |____my_application.h
| |____my_application.cc
| |____flutter
| | |____generated_plugin_registrant.cc
| | |____CMakeLists.txt
| | |____generated_plugins.cmake
| | |____generated_plugin_registrant.h
| | |____ephemeral
| | | |____.plugin_symlinks
| | | | |____path_provider_linux
| | | | | |____LICENSE
| | | | | |____test
| | | | | | |____path_provider_linux_test.dart
| | | | | | |____get_application_id_test.dart
| | | | | |____CHANGELOG.md
| | | | | |____AUTHORS
| | | | | |____example
| | | | | | |____test_driver
| | | | | | | |____integration_test.dart
| | | | | | |____integration_test
| | | | | | | |____path_provider_test.dart
| | | | | | |____README.md
| | | | | | |____pubspec.yaml
| | | | | | |____linux
| | | | | | | |____main.cc
| | | | | | | |____CMakeLists.txt
| | | | | | | |____my_application.h
| | | | | | | |____my_application.cc
| | | | | | | |____flutter
| | | | | | | | |____CMakeLists.txt
| | | | | | | | |____generated_plugins.cmake
| | | | | | |____lib
| | | | | | | |____main.dart
| | | | | |____README.md
| | | | | |____pubspec.yaml
| | | | | |____lib
| | | | | | |____path_provider_linux.dart
| | | | | | |____src
| | | | | | | |____path_provider_linux.dart
| | | | | | | |____get_application_id.dart
| | | | | | | |____get_application_id_stub.dart
| | | | | | | |____get_application_id_real.dart
| |____.gitignore
|____android
| |____app
| | |____build.gradle
| | |____src
| | | |____staging
| | | | |____res
| | | | | |____mipmap-mdpi
| | | | | | |____ic_launcher.png
| | | | | |____mipmap-hdpi
| | | | | | |____ic_launcher.png
| | | | | |____drawable
| | | | | | |____launch_background.xml
| | | | | |____mipmap-xxxhdpi
| | | | | | |____ic_launcher.png
| | | | | |____mipmap-xxhdpi
| | | | | | |____ic_launcher.png
| | | | | |____values-night
| | | | | | |____styles.xml
| | | | | |____values
| | | | | | |____styles.xml
| | | | | |____drawable-v21
| | | | | | |____launch_background.xml
| | | | | |____mipmap-xhdpi
| | | | | | |____ic_launcher.png
| | | |____development
| | | | |____res
| | | | | |____mipmap-mdpi
| | | | | | |____ic_launcher.png
| | | | | |____mipmap-hdpi
| | | | | | |____ic_launcher.png
| | | | | |____drawable
| | | | | | |____launch_background.xml
| | | | | |____mipmap-xxxhdpi
| | | | | | |____ic_launcher.png
| | | | | |____mipmap-xxhdpi
| | | | | | |____ic_launcher.png
| | | | | |____values-night
| | | | | | |____styles.xml
| | | | | |____values
| | | | | | |____styles.xml
| | | | | |____drawable-v21
| | | | | | |____launch_background.xml
| | | | | |____mipmap-xhdpi
| | | | | | |____ic_launcher.png
| | | |____profile
| | | | |____AndroidManifest.xml
| | | |____main
| | | | |____AndroidManifest.xml
| | | | |____java
| | | | | |____io
| | | | | | |____flutter
| | | | | | | |____plugins
| | | | | | | | |____GeneratedPluginRegistrant.java
| | | | |____kotlin
| | | | | |____com
| | | | | | |____example
| | | | | | | |____MainActivity.kt
| | | |____debug
| | | | |____AndroidManifest.xml
| |____local.properties
| |____gradle
| | |____wrapper
| | | |____gradle-wrapper.jar
| | | |____gradle-wrapper.properties
| |____gradlew
| |____.gitignore
| |____build.gradle
| |____gradle.properties
| |____gradlew.bat
| |____settings.gradle
|____.flutter-plugins-dependencies
|____lib
| |____main_development.dart
| |____bootstrap.dart
| |____main_production.dart
| |____features
| | |____splash_screen
| | | |____splash_screen.dart
| | |____features.dart
| |____common
| | |____constants
| | | |____image_type.dart
| | | |____url.dart
| | | |____storage_key.dart
| | | |____config.dart
| | | |____native_channels.dart
| | | |____constants.dart
| | |____utils
| | | |____app_utils.dart
| | | |____utils.dart
| | | |____app_colors.dart
| | | |____bloc_observer.dart
| | |____models
| | | |____links.freezed.dart
| | | |____failure.dart
| | | |____exception.dart
| | | |____meta.dart
| | | |____bad_response.dart
| | | |____base_response.freezed.dart
| | | |____meta.g.dart
| | | |____links.dart
| | | |____upload_document_models.dart
| | | |____links.g.dart
| | | |____meta.freezed.dart
| | | |____base_response.dart
| | | |____base_response.g.dart
| | | |____models.dart
| | |____extensions
| | | |____extensions.dart
| | | |____date_time_extensions.dart
| | | |____object_extensions.dart
| | | |____context_extensions.dart
| | | |____num_extensions.dart
| | | |____list_extensions.dart
| | | |____image_extensions.dart
| | | |____widget_extensions.dart
| | | |____string_extensions.dart
| | |____components
| | | |____default_circular_progress_indicator.dart
| | | |____components.dart
| | | |____default_scaffold.dart
| | | |____default_button.dart
| | | |____loading_overlay.dart
| | | |____my_tootip.dart
| | | |____default_text.dart
| | | |____default_image.dart
| | | |____default_appbar.dart
| | |____common.dart
| | |____routes
| | | |____routes.dart
| | | |____route_delegate.dart
| | | |____route_name.dart
| | | |____route_observer.dart
| | |____services
| | | |____storage
| | | | |____storage.dart
| | | | |____storage_service.dart
| | | |____pretty_loger_interceptors.dart
| | | |____api
| | | | |____curl_logger_interceptors.dart
| | | | |____pretty_logger_interceptors.dart
| | | | |____custom_interceptors.dart
| | | | |____network_service.dart
| | | | |____api_service.dart
| | | | |____api.dart
| | | |____injector_service.dart
| | | |____services.dart
| | | |____native_channels_service.dart
| |____main_staging.dart
| |____app.dart
|____.flutter-plugins
|____analysis_options.yaml
|____.dart_tool
| |____package_config.json
| |____extension_discovery
| | |____README.md
| | |____vs_code.json
| |____dartpad
| | |____web_plugin_registrant.dart
| |____package_config_subset
| |____version
|____windows
| |____CMakeLists.txt
| |____runner
| | |____flutter_window.cpp
| | |____utils.h
| | |____utils.cpp
| | |____runner.exe.manifest
| | |____CMakeLists.txt
| | |____win32_window.h
| | |____win32_window.cpp
| | |____resources
| | | |____app_icon.ico
| | |____resource.h
| | |____Runner.rc
| | |____main.cpp
| | |____flutter_window.h
| |____flutter
| | |____generated_plugin_registrant.cc
| | |____CMakeLists.txt
| | |____generated_plugins.cmake
| | |____generated_plugin_registrant.h
| | |____ephemeral
| | | |____.plugin_symlinks
| | | | |____path_provider_windows
| | | | | |____LICENSE
| | | | | |____test
| | | | | | |____path_provider_windows_test.dart
| | | | | |____CHANGELOG.md
| | | | | |____AUTHORS
| | | | | |____example
| | | | | | |____test_driver
| | | | | | | |____integration_test.dart
| | | | | | |____integration_test
| | | | | | | |____path_provider_test.dart
| | | | | | |____README.md
| | | | | | |____pubspec.yaml
| | | | | | |____lib
| | | | | | | |____main.dart
| | | | | | |____windows
| | | | | | | |____CMakeLists.txt
| | | | | | | |____runner
| | | | | | | | |____flutter_window.cpp
| | | | | | | | |____utils.h
| | | | | | | | |____run_loop.h
| | | | | | | | |____utils.cpp
| | | | | | | | |____runner.exe.manifest
| | | | | | | | |____CMakeLists.txt
| | | | | | | | |____win32_window.h
| | | | | | | | |____win32_window.cpp
| | | | | | | | |____resources
| | | | | | | | | |____app_icon.ico
| | | | | | | | |____resource.h
| | | | | | | | |____run_loop.cpp
| | | | | | | | |____Runner.rc
| | | | | | | | |____main.cpp
| | | | | | | | |____flutter_window.h
| | | | | | | |____flutter
| | | | | | | | |____CMakeLists.txt
| | | | | | | | |____generated_plugins.cmake
| | | | | |____README.md
| | | | | |____pubspec.yaml
| | | | | |____lib
| | | | | | |____path_provider_windows.dart
| | | | | | |____src
| | | | | | | |____path_provider_windows_real.dart
| | | | | | | |____folders_stub.dart
| | | | | | | |____path_provider_windows_stub.dart
| | | | | | | |____folders.dart
| |____.gitignore
|____.vscode
| |____extensions.json
| |____launch.json
|____.idea
| |____runConfigurations
| | |____production.xml
| | |____development.xml
| | |____staging.xml
```



[bloc_link]: https://bloclibrary.dev
[flutter_cross_platform_link]: https://flutter.dev/docs/development/tools/sdk/release-notes/supported-platforms
[flutter_flavors_link]: https://flutter.dev/docs/deployment/flavors
[github_actions_link]: https://github.com/features/actions
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logging_link]: https://api.flutter.dev/flutter/dart-developer/log.html
[null_safety_link]: https://flutter.dev/docs/null-safety
[testing_link]: https://flutter.dev/docs/testing
