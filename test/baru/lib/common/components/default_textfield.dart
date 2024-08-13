import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final bool isDynamicHeight;
  final FocusNode? focusNode;
  final Widget? suffix;
  final Widget? prefix;
  final InputBorder? disabledBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final bool isEnabled;
  final Color? filledColor;
  final Color? focusColor;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? onEditingComplete;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final EdgeInsets? contentPadding;
  final TextInputType keyboardType;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final Iterable<String>? autofillHints;
  final Color? cursorColor;
  final double? cursorWidth;
  final String? errorText;
  final String? helperText;
  final String? labelText;
  final String? counterText;
  final String? initialValue;
  final FormFieldValidator<String>? validator;

  const DefaultTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.textStyle,
    this.hintTextStyle,
    this.isDynamicHeight = false,
    this.focusNode,
    this.suffix,
    this.prefix,
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
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.maxLines,
    this.minLines,
    this.autofocus = false,
    this.readOnly = false,
    this.textInputAction,
    this.inputFormatters,
    this.autocorrect = true,
    this.autofillHints,
    this.cursorColor,
    this.cursorWidth,
    this.errorText,
    this.helperText,
    this.labelText,
    this.counterText,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return isDynamicHeight
        ? _buildDynamicHeightTextField()
        : _buildTextField(context: context);
  }

  Widget _buildDynamicHeightTextField() {
    return LayoutBuilder(
      builder: (context, size) {
        TextSpan text = TextSpan(
          text: controller.text,
          style: textStyle ??
              AppStyle.text(type: TextStyleType.regular, fontSize: 16.sp),
        );

        TextPainter tp = TextPainter(
          text: text,
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
        );
        tp.layout(maxWidth: size.maxWidth);

        int lines = (tp.size.height / tp.preferredLineHeight).ceil();
        int maxLines = this.maxLines ?? 10;

        return _buildTextField(
          lines: lines,
          maxLines: maxLines,
          context: context,
        );
      },
    );
  }

  Widget _buildTextField({
    int lines = 1,
    int? maxLines,
    BuildContext? context,
  }) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextField(
          style: textStyle ??
              AppStyle.text(
                type: TextStyleType.regular,
                fontSize: 20.sp,
                fontColor: context?.getColorExt(AppColorType.text),
              ),
          cursorColor: cursorColor ?? AppPalette.black.black50,
          cursorWidth: cursorWidth ?? 2.0,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onEditingComplete: onEditingComplete,
          maxLines:
              maxLines ?? (lines < (this.maxLines ?? 1) ? null : this.maxLines),
          minLines: minLines,
          autofocus: autofocus,
          readOnly: readOnly,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          autocorrect: autocorrect,
          autofillHints: autofillHints,
          decoration: InputDecoration(
            prefix: prefix,
            hintText: hintText,
            enabled: isEnabled,
            hintStyle: hintTextStyle ??
                AppStyle.text(
                  type: TextStyleType.regular,
                  fontSize: 16.sp,
                ),
            filled: true,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                    color: enabledBorderColor ?? AppPalette.primary.base,
                  ),
                ),
            fillColor: filledColor ?? AppPalette.background.base,
            focusColor: focusColor ?? AppPalette.background.base,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
              borderSide: BorderSide(color: AppPalette.primary.base),
            ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                    color: enabledBorderColor ?? AppPalette.primary.base,
                  ),
                ),
            disabledBorder: disabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.r)),
                  borderSide: BorderSide(
                    color: disabledBorderColor ?? AppPalette.primary.base,
                  ),
                ),
            errorText: errorText,
            helperText: helperText,
            labelText: labelText,
            counterText: counterText,
          ),
        ),
        if (suffix != null)
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
