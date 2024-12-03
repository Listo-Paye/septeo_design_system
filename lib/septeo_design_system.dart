library;

import 'package:flutter/material.dart';

import 'foundations/main_theme.dart';

export 'atomes/atomes_module.dart';
export 'foundations/foundations_module.dart';

class SepteoDesignSystem {
  static Themes themes = Themes();
}

class Themes {
  final ThemeData main = mainTheme;
}
