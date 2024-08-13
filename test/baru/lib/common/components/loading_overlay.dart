import 'package:flutter/material.dart';

import '../common.dart';

class LoadingOverlayAlt extends StatelessWidget {
  LoadingOverlayAlt({super.key, required this.child})
      : _isLoadingNotifier = ValueNotifier(false);

  final ValueNotifier<bool> _isLoadingNotifier;
  final Widget child;

  static LoadingOverlayAlt of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<LoadingOverlayAlt>()!;
  }

  void show() {
    _isLoadingNotifier.value = true;
  }

  void hide() {
    _isLoadingNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isLoadingNotifier,
      child: child,
      builder: (context, isLoading, child) {
        return Stack(
          children: [
            child!,
            if (isLoading)
              ModalBarrier(
                dismissible: false,
                color: Colors.black.withOpacity(0.5),
              ),
            if (isLoading)
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppPalette.black.black50,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const DefaultCircularProgressIndicator(),
                      const SizedBox(
                        height: 14,
                      ),
                      DefaultText(
                        'Mohon Tunggu...',
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w700,
                        color: AppPalette.white.base,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

// Future showCustomBottomSheet(Widget widget, {Color? bgColor}) {
//   return showModalBottomSheet(
//     isScrollControlled: true,
//     context: globalContext!,
//     backgroundColor: bgColor ?? AppPalette.background,
//     builder: (BuildContext builderContext) => LoadingOverlayAlt(
//       child: SingleChildScrollView(
//         child: widget,
//       ),
//     ),
//   );
// }

// void showCustomDialog(Widget widget, {bool barrierDismissible = true}) {
//   showDialog(
//     context: globalContext!,
//     barrierDismissible: barrierDismissible,
//     barrierColor: const Color(0x55000000),
//     builder: (BuildContext builderContext) => LoadingOverlayAlt(child: widget),
//   );
// }

// void showLoading() {
//   return LoadingOverlayAlt.of(globalContext!).show();
// }

// void dismissLoading() {
//   return LoadingOverlayAlt.of(globalContext!).hide();
// }
