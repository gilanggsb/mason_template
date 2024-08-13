import 'package:flutter/material.dart';

import '../common.dart';

class DefaultText extends StatelessWidget {
  const DefaultText(
    this.text, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.inherit,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.textHeight,
    this.leadingDistribution,
    this.foreground,
    this.textBackground,
    this.shadows,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
    this.fontFamily,
    this.package,
    this.fontFamilyFallback,
    this.suffix,
    this.enableIndentForFirstCharacter = false,
    this.mainAxisAlignmentRow,
    this.onTap,
  });
  final String text;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final bool? inherit;
  final Color? color;
  final Color? backgroundColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final TextBaseline? textBaseline;
  final double? textHeight;
  final TextLeadingDistribution? leadingDistribution;
  final Paint? foreground;
  final Paint? textBackground;
  final List<Shadow>? shadows;
  final List<FontFeature>? fontFeatures;
  final List<FontVariation>? fontVariations;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;
  final double? decorationThickness;
  final String? debugLabel;
  final String? fontFamily;
  final List<String>? fontFamilyFallback;
  final String? package;
  final bool enableIndentForFirstCharacter;
  final Widget? suffix;
  final MainAxisAlignment? mainAxisAlignmentRow;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: mainAxisAlignmentRow ?? MainAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              "${enableIndentForFirstCharacter ? '\t' : ''}$text",
              style: generateTextStyle(context),
              textAlign: textAlign,
              key: key,
              locale: locale,
              maxLines: maxLines,
              overflow: overflow,
              selectionColor: selectionColor,
              semanticsLabel: semanticsLabel,
              softWrap: softWrap,
              strutStyle: strutStyle,
              textDirection: textDirection,
              textHeightBehavior: textHeightBehavior,
              textWidthBasis: textWidthBasis,
            ),
          ),
          suffix ?? const SizedBox.shrink(),
        ],
      ),
    );
  }

  TextStyle generateTextStyle(BuildContext context) {
    return (style ?? context.textThemeExt.bodyLarge).copyWith(
      textBaseline: textBaseline,
      background: textBackground,
      backgroundColor: backgroundColor,
      color: color ?? context.getColorExt(AppColorType.text),
      debugLabel: debugLabel,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
      fontFamily: fontFamily,
      fontFamilyFallback: fontFamilyFallback,
      fontFeatures: fontFeatures,
      fontSize: fontSize,
      fontStyle: fontStyle,
      fontVariations: fontVariations,
      fontWeight: fontWeight,
      foreground: foreground,
      height: textHeight,
      inherit: inherit,
      leadingDistribution: leadingDistribution,
      letterSpacing: letterSpacing,
      locale: locale,
      overflow: overflow,
      package: package,
      shadows: shadows,
      wordSpacing: wordSpacing,
    );
  }
}
