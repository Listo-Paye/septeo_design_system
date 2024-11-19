import 'package:flutter/material.dart';
import 'package:septeo_design_system/themes/septeo_colors.dart';
import 'package:septeo_design_system/themes/septeo_text_styles.dart';

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
      labelLarge: SepteoTextStyles.captionInter,
      titleMedium: SepteoTextStyles.headingMediumInter,
      titleSmall: SepteoTextStyles.headingSmallInter,
      titleLarge: SepteoTextStyles.headingLargeInter,
      displayLarge: SepteoTextStyles.headingLargeInter,
      displaySmall: SepteoTextStyles.headingSmallInter,
      displayMedium: SepteoTextStyles.headingMediumInter,
    ));
