import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  runZonedGuarded<Future<void>>(
    () async {
      FlutterError.onError = (details) {
        AppUtils.debugPrint(
          details.exceptionAsString(),
          stackTrace: details.stack,
          level: LogLevel.error,
        );
      };
      WidgetsFlutterBinding.ensureInitialized();
      Bloc.observer = MyBlocObserver();

      await [
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]),
        InjectorService.create()
      ].wait;

      runApp(await builder());
    },
    (error, stack) => AppUtils.debugPrint(
      'RunzonedGuarded Error :$error \nStackTrace : $stack ',
      level: LogLevel.error,
    ),
  );
}
