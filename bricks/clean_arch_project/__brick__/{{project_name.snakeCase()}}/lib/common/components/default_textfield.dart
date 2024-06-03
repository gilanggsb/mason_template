import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:{{project_name.snakeCase()}}/common/common.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final bool isDynamicHeight;
  final FocusNode? focusNode;
  final Widget? suffix;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool isEnabled;
  final Color? filledColor;
  final Color? focusColor;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(String)? onEditingComplete;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final EdgeInsets? contentPadding;

  const DefaultTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textStyle,
    this.hintTextStyle,
    this.isDynamicHeight = false,
    this.focusNode,
    this.suffix,
    this.isEnabled = true,
    this.disabledBorder,
    this.enabledBorder,
    this.filledColor,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.focusColor,
    this.contentPadding,
    this.focusedBorder,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    if (!isDynamicHeight) {
      return buildTextField(focusNode);
    }
    return LayoutBuilder(
      builder: (context, size) {
        TextSpan text = TextSpan(
          text: controller.text,
          style: textStyle ?? AppStyle.regularTextStyle(fontSize: 16.sp),
        );

        TextPainter tp = TextPainter(
          text: text,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
        );
        tp.layout(maxWidth: size.maxWidth);

        int lines = (tp.size.height / tp.preferredLineHeight).ceil();
        int maxLines = 10;

        return buildTextField(focusNode, lines: lines, maxLines: maxLines);
      },
    );
  }

  Widget buildTextField(
    FocusNode? focusNode, {
    int lines = 0,
    int maxLines = 2,
  }) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          style: textStyle ??
              AppStyle.regularTextStyle(
                fontSize: 20.sp,
              ),
          cursorColor: AppColors.black,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: TextInputType.text,
          onEditingComplete: () {
            if (onEditingComplete == null) return;
            onEditingComplete!(controller.text);
          },
          maxLines: lines < maxLines ? null : maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            enabled: isEnabled,
            hintStyle:
                hintTextStyle ?? AppStyle.regularTextStyle(fontSize: 16.sp),
            filled: true,
            contentPadding: contentPadding ??
                const EdgeInsets.only(
                  bottom: 16,
                  top: 16,
                  left: 16,
                  right: 34,
                ),
            focusedBorder: focusedBorder,
            fillColor: filledColor ?? AppColors.primaryLight,
            focusColor: focusColor ?? AppColors.primaryLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              borderSide: const BorderSide(
                color: AppColors.primaryLight,
              ),
            ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                    color: enabledBorderColor ?? AppColors.primaryLight,
                  ),
                ),
            disabledBorder: disabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                    color: disabledBorderColor ?? AppColors.primaryLight,
                  ),
                ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: suffix,
          ),
        ),
      ],
    );
  }
}
