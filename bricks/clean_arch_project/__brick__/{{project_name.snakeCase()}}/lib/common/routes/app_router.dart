import 'package:auto_route/auto_route.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';
import 'package:flutter/material.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
BuildContext globalContext = globalNavigatorKey.currentContext!;
AppRouter appRouter = getIt.get<AppRouter>();

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  GlobalKey<NavigatorState> get navigatorKey => globalNavigatorKey;

  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashRoute.page,
          path: RouteName.splash.pathName,
          initial: true,
        ),
      ];
}
