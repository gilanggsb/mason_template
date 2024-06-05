import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void checkUser() async {
    Future.delayed(const Duration(seconds: 1), () {
      globalContext.replaceRoute(const HomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      onInit: checkUser,
      body: Center(
        child: Text(
          '{{project_name}}',
          style: AppStyle.semiBoldTextStyle(
              fontSize: 36, fontColor: AppColors.black, letterSpacing: 4),
        ),
      ),
    );
  }
}
