import 'package:flutter/material.dart';

import '../common.dart';

class EmptyStateWidget extends StatelessWidget {
  final String title;
  final String message;
  final Widget? icon;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final VoidCallback? onButtonPressed;
  final String buttonText;

  const EmptyStateWidget({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.titleStyle,
    this.messageStyle,
    this.onButtonPressed,
    this.buttonText = "Take Action",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(height: 16.0),
            DefaultText(
              title,
              style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            DefaultText(
              message,
              style: messageStyle ?? Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (onButtonPressed != null) ...[
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: onButtonPressed,
                child: DefaultText(buttonText),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
