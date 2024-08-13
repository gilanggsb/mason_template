import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../common.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();
BuildContext globalContext = globalNavigatorKey.currentContext!;
AppRouter appRouter = getIt.get<AppRouter>();

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends RootStackRouter {
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
        AutoRoute(
          page: RootWrapper.page,
          path: RouteName.root.pathName,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: RouteName.home.pathName,
              initial: true,
            ),
          ],
        ),
      ];
}
