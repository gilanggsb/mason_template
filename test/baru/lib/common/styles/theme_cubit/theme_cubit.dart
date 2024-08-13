import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../common.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required this.storageService})
      : super(const ThemeState.initial());
  ThemeMode themeMode = ThemeMode.dark;
  final Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  late bool isDarkTheme = brightness == Brightness.dark;
  final StorageService storageService;

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 500));
    String? resultTheme = await storageService.getCurrentTheme();
    if (resultTheme.isNull) {
      return;
    }
    resultTheme == "light"
        ? _changeTheme(isChanged: false)
        : _changeTheme(isChanged: true);
    _emitSuccess();
  }

  void switchTheme() {
    _changeTheme();
    storageService.switchTheme(isDarkTheme);
    _emitSuccess();
  }

  void _changeTheme({bool? isChanged}) {
    isDarkTheme = isChanged ?? !isDarkTheme;
    isDarkTheme ? themeMode = ThemeMode.dark : themeMode = ThemeMode.light;
  }

  Future<void> getCurrentTheme() async {
    String? resultTheme = await storageService.getCurrentTheme();
    resultTheme == "light"
        ? _changeTheme(isChanged: false)
        : _changeTheme(isChanged: true);
    _emitSuccess();
  }

  void _emitSuccess() {
    emit(ThemeState.loaded(isDarkTheme));
  }
}
