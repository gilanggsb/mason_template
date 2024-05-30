import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../presentation.dart';
import '../../../domain/domain.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';
part '{{name.snakeCase()}}_bloc.freezed.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Repository repository;
  {{name.pascalCase()}}Bloc({required this.repository}) : super(const _Initial()) {
    on<{{name.pascalCase()}}Event>(_getData);
  }

  void initialization() {
    
  }
  
  FutureOr<void> _getData(event, emit) async {
    try{
    } on ServerFailure catch (e) {
      _emitFailed(emit, e.message);
    } catch (e) {
      _emitFailed(emit, e.toString());
    }
  }

  void _emitFailed(Emitter<{{name.pascalCase()}}State> emit, String message) {
    emit({{name.pascalCase()}}State.failed(message));
  }
}
