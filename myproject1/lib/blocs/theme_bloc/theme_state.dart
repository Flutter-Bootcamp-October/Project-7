import 'package:flutter/material.dart';

sealed class ThemeBlocState {}

final class GetThemeState extends ThemeBlocState {
  final ThemeData themeData;

  GetThemeState(this.themeData);
}
