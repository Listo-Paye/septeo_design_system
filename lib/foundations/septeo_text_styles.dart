import 'package:flutter/material.dart';
import 'package:septeo_design_system/foundations/septeo_colors.dart';

/// Septeo Text Styles
///
/// This class contains all the text styles used in the Septeo Design System.
abstract final class SepteoTextStyles {
  // Inter Regular (w500)
  static final TextStyle legalContentInter = TextStyle(
    fontSize: 10,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle captionInter = TextStyle(
    fontSize: 12,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle bodySmallInter = TextStyle(
    fontSize: 14,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle bodyMediumInter = TextStyle(
    fontSize: 16,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle bodyLargeInter = TextStyle(
    fontSize: 18,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle headingSmallInter = TextStyle(
    fontSize: 22,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle headingMediumInter = TextStyle(
    fontSize: 24,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle headingLargeInter = TextStyle(
    fontSize: 28,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );
  static final TextStyle heroInter = TextStyle(
    fontSize: 32,
    height: 1.5,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    color: SepteoColors.grey.shade900,
  );

  // Inter Bold (w700)
  static final TextStyle legalContentInterBold =
      legalContentInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle captionInterBold =
      captionInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle bodySmallInterBold =
      bodySmallInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle bodyMediumInterBold =
      bodyMediumInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle bodyLargeInterBold =
      bodyLargeInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle headingSmallInterBold =
      headingSmallInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle headingMediumInterBold =
      headingMediumInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle headingLargeInterBold =
      headingLargeInter.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle heroInterBold =
      heroInter.copyWith(fontWeight: FontWeight.w700);

  // Poppins Regular (w500)
  static final TextStyle legalContentPopins =
      legalContentInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle captionPopins =
      captionInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle bodySmallPopins =
      bodySmallInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle bodyMediumPopins =
      bodyMediumInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle bodyLargePopins =
      bodyLargeInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle headingSmallPopins =
      headingSmallInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle headingMediumPopins =
      headingMediumInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle headingLargePopins =
      headingLargeInter.copyWith(fontFamily: 'Poppins');
  static final TextStyle heroPopins = heroInter.copyWith(fontFamily: 'Poppins');

  // Poppins Bold (w700)
  static final TextStyle legalContentPopinsBold =
      legalContentPopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle captionPopinsBold =
      captionPopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle bodySmallPopinsBold =
      bodySmallPopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle bodyMediumPopinsBold =
      bodyMediumPopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle bodyLargePopinsBold =
      bodyLargePopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle headingSmallPopinsBold =
      headingSmallPopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle headingMediumPopinsBold =
      headingMediumPopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle headingLargePopinsBold =
      headingLargePopins.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle heroPopinsBold =
      heroPopins.copyWith(fontWeight: FontWeight.w700);
}
