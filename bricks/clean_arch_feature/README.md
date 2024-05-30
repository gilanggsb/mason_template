# Clean Architecture Feature Brick

A new brick that create feature with clean architecture.

## Dependecies
1. flutter_bloc
2. freezed_annotation
3. json_annotation

## Dev Dependecies
1. freezed
2. json_serializable

## Usage 🚀
```
mason make clean_arch_feature
```

#### Variables
| Variable      | Description | 
| :---        |    :----:   |   
| Name      | The Feature name |

## Output
```
.
|____login.dart
|____data
| |____datasources
| | |____datasources.dart
| | |____local
| | | |____local.dart
| | | |____login_local_datasource.dart
| | | |____login_local_datasource_impl.dart
| | |____remote
| | | |____remote.dart
| | | |____login_remote_datasource.dart
| | | |____login_remote_datasource_impl.dart
| |____data.dart
| |____repositories
| | |____login_repository_impl.dart
| | |____repositories.dart
| |____models
| | |____models.dart
| |____services
| | |____services.dart
| | |____login_injection.dart
|____domain
| |____repositories
| | |____login_repository.dart
| | |____repositories.dart
| |____domain.dart
|____presentation
| |____presentation.dart
| |____screens
| | |____screens.dart
| | |____login_screen.dart
| |____controllers
| | |____controllers.dart
| | |____bloc
| | | |____login_bloc.dart
| | | |____login_event.dart
| | | |____login_state.dart
| |____widgets
| | |____widgets.dart
```