import 'package:flutter_bloc/flutter_bloc.dart';

import '../common.dart';

class MyBlocObserver extends BlocObserver {
  // List of blocked BLoCs types
  final List<Type> blockedBlocs = [
    // Add the types of the BLoCs you want to block here
    // Example: SomeBloc, AnotherBloc
  ];

  bool _isBlocked(BlocBase bloc) {
    return blockedBlocs.contains(bloc.runtimeType);
  }

  @override
  void onCreate(BlocBase bloc) {
    if (!_isBlocked(bloc)) {
      Logger.logInfo('BlocObs onCreate -- ${bloc.runtimeType}');
    }
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (!_isBlocked(bloc)) {
      Logger.logInfo('BlocObs onChange -- ${bloc.runtimeType}, $change');
    }
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (!_isBlocked(bloc)) {
      Logger.logInfo('BlocObs onError -- ${bloc.runtimeType}, $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    if (!_isBlocked(bloc)) {
      Logger.logInfo('onClose -- ${bloc.runtimeType}');
    }
    super.onClose(bloc);
  }
}
