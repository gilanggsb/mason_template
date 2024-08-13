import 'package:flutter/material.dart';

import '../common.dart';

class SliderContainer extends StatefulWidget {
  final double value;
  final double? min;
  final double? max;
  final double? sliderHeight;
  final Color? sliderColor;
  final Color? backgroundColor;
  final double? dragAreaHeight;
  final Color? circleColor;
  final double? circleRadius;
  final Duration? duration;
  final ValueChanged<double>? onChanged;

  const SliderContainer({
    super.key,
    required this.value,
    this.min,
    this.max,
    this.sliderHeight,
    this.sliderColor,
    this.backgroundColor,
    this.dragAreaHeight,
    this.circleColor,
    this.circleRadius,
    this.duration,
    this.onChanged,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  bool _isDragging = false;

  @override
  void didUpdateWidget(SliderContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _updateWidth(widget.value);
    }
  }

  void _updateWidth(double newWidth) {
    double min = widget.min ?? 0;
    double max = widget.max ?? double.infinity;
    double clampedWidth = newWidth.clamp(min, max);

    // Update state only if the width has actually changed
    if (clampedWidth != widget.value) {
      setState(() {
        if (widget.onChanged != null) {
          widget.onChanged!(clampedWidth);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset localPosition = box.globalToLocal(details.globalPosition);
        double newWidth = localPosition.dx;
        _updateWidth(newWidth);
        setState(() {
          _isDragging = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _isDragging = false;
        });
      },
      onHorizontalDragStart: (details) {
        setState(() {
          _isDragging = true;
        });
      },
      onHorizontalDragUpdate: (details) {
        RenderBox box = context.findRenderObject() as RenderBox;
        Offset localPosition = box.globalToLocal(details.globalPosition);
        double newWidth = localPosition.dx;
        _updateWidth(newWidth);
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          _isDragging = false;
        });
      },
      child: Container(
        height: widget.dragAreaHeight ?? 40,
        width: double.infinity,
        color: widget.backgroundColor ?? Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: widget.duration ?? const Duration(milliseconds: 300),
                height: widget.sliderHeight ?? 2,
                color: widget.sliderColor ??
                    context.getColorExt(AppColorType.primary),
                width: widget.value,
              ),
            ),
            if (_isDragging)
              Positioned(
                left: widget.value - (widget.circleRadius ?? 10),
                top: (widget.dragAreaHeight ?? 40) / 2 -
                    (widget.circleRadius ?? 10),
                child: Container(
                  width: (widget.circleRadius ?? 10) * 2,
                  height: (widget.circleRadius ?? 10) * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.circleColor ??
                        context.getColorExt(AppColorType.primaryLight),
                  ),
                ),
              ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: widget.value,
                  height: widget.dragAreaHeight ?? 40,
                  color: Colors.transparent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
