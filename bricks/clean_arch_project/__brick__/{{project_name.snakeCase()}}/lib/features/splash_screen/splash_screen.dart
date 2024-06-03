import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void checkUser() async {
    // globalContext.replaceRoute(HomeRoute(titleArgs: 'test'));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      onInit: checkUser,
      body: Center(
        child: Text(
          'chat',
          style: AppStyle.semiBoldTextStyle(
              fontSize: 36, fontColor: AppColors.black, letterSpacing: 4),
        ),
      ),
    );
  }
}
