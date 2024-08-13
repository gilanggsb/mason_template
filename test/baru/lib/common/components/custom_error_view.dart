import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../common.dart';

class CustomErrorView extends StatelessWidget {
  final FlutterErrorDetails? flutterErrorDetails;
  const CustomErrorView({super.key, this.flutterErrorDetails});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("error_image".toPng),
              DefaultText(
                kDebugMode
                    ? flutterErrorDetails?.exceptionAsString() ??
                        "Flutter null Error"
                    : "Sorry! Something went wrong!",
                textAlign: TextAlign.center,
                color: Colors.red[700],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              if (!kDebugMode)
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: DefaultText(
                    'An error has ocurred now. The error will be reviewed and correted by our team. Thank you for your patience.',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
