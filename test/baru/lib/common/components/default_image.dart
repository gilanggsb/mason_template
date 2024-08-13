import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as cm;
import '../common.dart';

class DefaultImage extends StatelessWidget {
  final String imageUrl;
  final String? cacheKey;
  final String? cacheManagerKey;
  final Duration? staleImagePeriod;
  final Alignment? alignment;
  final double? width, height;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final Color? color;
  final BoxFit? fit;
  final Widget? errorWidget;
  final BoxDecoration? decoration;
  final ImageType? imageType;

  const DefaultImage({
    super.key,
    required this.imageUrl,
    this.cacheKey,
    required this.width,
    this.height,
    this.cacheManagerKey,
    this.staleImagePeriod,
    this.alignment,
    this.imageBuilder,
    this.color,
    this.fit,
    this.errorWidget,
    this.decoration,
    this.imageType = ImageType.network,
  });

  @override
  Widget build(BuildContext context) {
    if (imageType == ImageType.file) {
      return Image.file(
        File(imageUrl),
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        color: color,
        fit: fit,
        cacheHeight: height?.toInt(),
        cacheWidth: width?.toInt(),
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? const Icon(Icons.error),
      );
    }

    if (imageType == ImageType.asset) {
      return Image.asset(
        imageUrl,
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        color: color,
        fit: fit,
        cacheHeight: height?.toInt(),
        cacheWidth: width?.toInt(),
        errorBuilder: (context, error, stackTrace) =>
            errorWidget ?? const Icon(Icons.error),
      );
    }

    return CachedNetworkImage(
      cacheKey: cacheKey,
      imageUrl: imageUrl,
      height: height,
      width: width,
      alignment: alignment ?? Alignment.center,
      color: color,
      fit: fit,
      imageBuilder: imageBuilder ??
          (context, imageProvider) => Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  border: decoration?.border,
                  borderRadius: decoration?.borderRadius,
                  shape: decoration?.shape ?? BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      cacheManager: cm.CacheManager(
        cm.Config(
          cacheManagerKey ?? imageUrl,
          stalePeriod: staleImagePeriod ?? const Duration(days: 1),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => CircleAvatar(
        backgroundColor: Colors.transparent,
        child: DefaultCircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) =>
          errorWidget ?? const Icon(Icons.error),
    );
  }
}
