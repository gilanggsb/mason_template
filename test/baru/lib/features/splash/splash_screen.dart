import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void checkUser() async {
    await Future.delayed(const Duration(seconds: 1));
    if (globalContext.mounted) globalContext.replaceRoute(const HomeRoute());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      onInit: checkUser,
      body: Center(
        child: Text(
          'baru',
          style: AppStyle.text(),
        ),
      ),
    );
  }
}
