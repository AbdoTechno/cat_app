import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_sizes.dart';

abstract final class AppTextStyles {
  static TextStyle get displayLarge => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize48,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get displayMedium => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize36,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get displaySmall => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize28,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get headlineLarge => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize24,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get headlineMedium => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize20,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get headlineSmall => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleLarge => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleMedium => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize16,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get titleSmall => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get bodyLarge => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize16,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get bodyMedium => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize14,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get bodySmall => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize12,
    fontWeight: FontWeight.normal,
  );

  static TextStyle get labelLarge => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get labelMedium => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get labelSmall => GoogleFonts.cairo(
    fontSize: AppSizes.fontSize11,
    fontWeight: FontWeight.w500,
  );

  static TextTheme textTheme(Color textColor) {
    return TextTheme(
      displayLarge: displayLarge.copyWith(color: textColor),
      displayMedium: displayMedium.copyWith(color: textColor),
      displaySmall: displaySmall.copyWith(color: textColor),
      headlineLarge: headlineLarge.copyWith(color: textColor),
      headlineMedium: headlineMedium.copyWith(color: textColor),
      headlineSmall: headlineSmall.copyWith(color: textColor),
      titleLarge: titleLarge.copyWith(color: textColor),
      titleMedium: titleMedium.copyWith(color: textColor),
      titleSmall: titleSmall.copyWith(color: textColor),
      bodyLarge: bodyLarge.copyWith(color: textColor),
      bodyMedium: bodyMedium.copyWith(color: textColor),
      bodySmall: bodySmall.copyWith(color: textColor),
      labelLarge: labelLarge.copyWith(color: textColor),
      labelMedium: labelMedium.copyWith(color: textColor),
      labelSmall: labelSmall.copyWith(color: textColor),
    );
  }
}
