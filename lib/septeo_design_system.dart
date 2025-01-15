library;

import 'package:flutter/material.dart';

import 'foundations/main_theme.dart';

export 'atomes/atomes_module.dart';
export 'foundations/foundations_module.dart';

/// The main entry point for the Septeo Design System.
///
/// This class contains all the themes used in the Septeo Design System.
class SepteoDesignSystem {
  static Themes themes = Themes();
}

/// Themes
///
/// This class contains all the themes used in the Septeo Design System.
class Themes {
  final ThemeData main = mainTheme;
}
