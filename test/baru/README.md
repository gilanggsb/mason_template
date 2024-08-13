# Baru

A new Flutter project.

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart --dart-define FLAVOR=development

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart --dart-define FLAVOR=staging

# Production
$ flutter run --flavor production --target lib/main_production.dart --dart-define FLAVOR=production
```

_\*Baru works on iOS, Android, Web, and Windows._

---

## How To Create Model Using Freezed

1. Create file 'example_model.dart'
2. Copy code below and change with your model
    ```
    import 'package:freezed_annotation/freezed_annotation.dart';
    part 'example_model.freezed.dart';
    part 'example_model.g.dart';

    @freezed 
    class ExampleModel with _$ExampleModel{
    const factory ExampleModel({
        required String name,
        int? value,
    })=_ExampleModel;
    factory ExampleModel.fromJson(Map<String,dynamic> json)=>_$ExampleModelFromJson(json);
    }
    ```
3. Then run flutter pub run build_runner build --delete-conflicting-outputs
4. [for more information click this][freezed]

## Build APK

1. Development 
    ```
    flutter build apk --split-per-abi -debug --obfuscate --split-debug-info=./split-debug-info-development --flavor development -t lib/main_staging.dart --dart-define FLAVOR=development
    ```

2. Staging 
    ```
    flutter build apk --split-per-abi --obfuscate --split-debug-info=./split-debug-info-development --flavor staging -t lib/main_staging.dart --dart-define FLAVOR=staging
    ```

3. Production
    ```
    flutter build apk --split-per-abi --obfuscate --split-debug-info=./split-debug-info-development --flavor production -t lib/main_production.dart staging
    ```

## How to insert assets
1. Put your assets into "assets" folder
2. Then run flutter pub run build_runner build --delete-conflicting-outputs
3. to use assets "Assets.images.mainLogo.image()"
4. [for more information](https://pub.dev/packages/flutter_gen_runner)

## List Generator
1. [Auto Route][auto_route] : for generate routing navigation between page
2. [Freezed][freezed] : for generate model
3. [Json Serializable][json_serializable] : for generate json
4. [Envied][envied] : for generate environment

[auto_route]: https://pub.dev/packages/auto_route
[freezed]: https://pub.dev/packages/freezed
[envied]: https://pub.dev/packages/envied
[json_serializable]: https://pub.dev/packages/json_serializable