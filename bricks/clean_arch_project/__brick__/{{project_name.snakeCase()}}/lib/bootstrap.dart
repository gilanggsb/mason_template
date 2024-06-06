import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  runZonedGuarded<Future<void>>(
    () async {
      Env.load();
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
    (error, stack) => Logger.logError(
      'RunzonedGuarded Error :$error \nStackTrace : $stack ',
    ),
  );
}
