import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    AppUtils.debugPrint('BlocObs onCreate -- ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    AppUtils.debugPrint('BlocObs onChange -- ${bloc.runtimeType}, $change');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppUtils.debugPrint('BlocObs onError -- ${bloc.runtimeType}, $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    AppUtils.debugPrint('onClose -- ${bloc.runtimeType}');
    super.onClose(bloc);
  }
}
