part of '{{name.snakeCase()}}_bloc.dart';

@freezed
class {{name.pascalCase()}}State with _${{name.pascalCase()}}State {
  const factory {{name.pascalCase()}}State.initial() = _Initial;
  const factory {{name.pascalCase()}}State.loading() = _Loading;
  const factory {{name.pascalCase()}}State.loaded() = _Loaded;
  const factory {{name.pascalCase()}}State.failed(String message) = _Error;
}
