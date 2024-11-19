library;

import 'package:flutter/material.dart';

import 'themes/main_theme.dart';
export 'themes/themes_module.dart';

class SepeteoDesignSystem {
  static Themes themes = Themes();
}

class Themes {
  final ThemeData main = mainTheme;
}
