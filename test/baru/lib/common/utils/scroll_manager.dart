import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class ScrollManager<T> {
  final ScrollController scrollController;
  final Map<int, double> itemHeights = {};
  final Map<T, int> modelToIndex = {};
  final bool Function(T, T) compare;

  ScrollManager({required this.compare})
      : scrollController = ScrollController();

  void registerItems(List<T> items) {
    for (int i = 0; i < items.length; i++) {
      registerItem(i, items[i]);
    }
  }

  void registerItem(int index, T item) {
    modelToIndex[item] = index;
  }

  void updateItemHeight(int index, double height) {
    itemHeights[index] = height;
  }

  void scrollToModel(T item) {
    int? index = modelToIndex.entries
        .firstWhereOrNull(
          (entry) => compare(entry.key, item),
        )
        ?.value;
    if (index != null) {
      scrollToIndex(index);
    }
  }

  void scrollToIndex(int index) {
    double offset = 0.0;
    for (int i = 0; i < index; i++) {
      offset += itemHeights[i] ?? 0.0;
    }

    _debounce(() {
      scrollController.animateTo(
        offset,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  void _debounce(VoidCallback callback, {int milliseconds = 200}) {
    Timer(Duration(milliseconds: milliseconds), callback);
  }

  ScrollController getScrollController() {
    return scrollController;
  }

  T? getCurrentItem() {
    double offset = scrollController.offset;
    double totalHeight = 0.0;
    for (var entry in itemHeights.entries) {
      totalHeight += entry.value;
      if (totalHeight > offset) {
        return modelToIndex.keys.firstWhereOrNull(
          (key) => modelToIndex[key] == entry.key,
        );
      }
    }
    return null;
  }

  int? getCurrentIndex() {
    double offset = scrollController.offset;
    double totalHeight = 0.0;
    for (var entry in itemHeights.entries) {
      totalHeight += entry.value;
      if (totalHeight > offset) {
        return entry.key;
      }
    }
    return null;
  }

  void dispose() {
    scrollController.dispose();
  }
}
