import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/common.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          builder: (context, child) {
            ErrorWidget.builder = (FlutterErrorDetails? flutterErrorDetails) {
              return CustomErrorView(
                flutterErrorDetails: flutterErrorDetails,
              );
            };
            return SafeArea(
              child: LoadingOverlayAlt(
                child: child!,
              ),
            );
          },
          routerConfig: appRouter.config(
            navigatorObservers: () => [RouterObserver()],
          ),
        );
      },
    );
  }
}
