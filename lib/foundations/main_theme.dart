import 'package:flutter/material.dart';
import 'package:septeo_design_system/foundations/septeo_colors.dart';
import 'package:septeo_design_system/foundations/septeo_text_styles.dart';

/// Main theme for your application
///
/// This theme is used as the default theme for your application.
///
/// Example of usage:
/// ```dart
/// MaterialApp(
///  theme: SepteoDesignSystem.themes.main,
///  home: MyHomePage(),
/// );
///  ```
final mainTheme = ThemeData(
    primarySwatch: SepteoColors.blue,
    primaryColor: SepteoColors.blue.shade900,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: SepteoTextStyles.bodyLargeInter,
      bodyMedium: SepteoTextStyles.bodyMediumInter,
      bodySmall: SepteoTextStyles.bodySmallInter,
      headlineMedium: SepteoTextStyles.headingMediumInter,
      headlineSmall: SepteoTextStyles.headingSmallInter,
      headlineLarge: SepteoTextStyles.headingLargeInter,
      labelLarge: SepteoTextStyles.bodyMediumInter,
      titleMedium: SepteoTextStyles.headingMediumInter,
      titleSmall: SepteoTextStyles.headingSmallInter,
      titleLarge: SepteoTextStyles.headingLargeInter,
      displayLarge: SepteoTextStyles.headingLargeInter,
      displaySmall: SepteoTextStyles.headingSmallInter,
      displayMedium: SepteoTextStyles.headingMediumInter,
    ));
