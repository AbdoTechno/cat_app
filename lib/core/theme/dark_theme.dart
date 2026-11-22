import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_text_styles.dart';

ThemeData get darkTheme {
  OutlineInputBorder inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.r12),
      borderSide: BorderSide(color: color),
    );
  }

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    canvasColor: AppColors.darkBackground,
    textTheme: AppTextStyles.textTheme(AppColors.darkText),
    splashFactory: NoSplash.splashFactory,
    dividerColor: AppColors.darkBorder,
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkAccent,
      onPrimary: AppColors.onDarkAccent,
      primaryContainer: AppColors.darkAccentContainer,
      onPrimaryContainer: AppColors.darkText,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.onDarkAccent,
      secondaryContainer: AppColors.darkSecondaryContainer,
      onSecondaryContainer: AppColors.darkText,
      error: AppColors.darkDanger,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkText,
      outline: AppColors.darkBorder,
      surfaceContainerHighest: AppColors.darkSurfaceHigh,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.darkText,
      ),
      iconTheme: IconThemeData(color: AppColors.darkText, size: 24),
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        side: const BorderSide(color: AppColors.darkBorder),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.darkBorder,
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkAccent,
        foregroundColor: AppColors.onDarkAccent,
        disabledBackgroundColor: AppColors.darkSurfaceHigh,
        disabledForegroundColor: AppColors.darkDisabled,
        minimumSize: Size.fromHeight(AppSizes.buttonHeight),
        elevation: 0,
        textStyle: AppTextStyles.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkAccent,
        disabledForegroundColor: AppColors.darkDisabled,
        minimumSize: Size.fromHeight(AppSizes.buttonHeight),
        side: const BorderSide(color: AppColors.darkBorder),
        textStyle: AppTextStyles.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkAccent,
        disabledForegroundColor: AppColors.darkDisabled,
        minimumSize: Size(AppSizes.iconExtraLarge, AppSizes.iconExtraLarge),
        textStyle: AppTextStyles.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSurface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.p16,
        vertical: AppSizes.p16,
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkTextMuted,
      ),
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkTextSecondary,
      ),
      errorStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.danger),
      border: inputBorder(AppColors.darkBorder),
      enabledBorder: inputBorder(AppColors.darkBorder),
      focusedBorder: inputBorder(AppColors.darkAccent),
      errorBorder: inputBorder(AppColors.darkDanger),
      focusedErrorBorder: inputBorder(AppColors.darkDanger),
      disabledBorder: inputBorder(AppColors.darkBorder),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.darkSurface,
      selectedColor: AppColors.darkAccent,
      disabledColor: AppColors.darkSurfaceRaised,
      side: const BorderSide(color: AppColors.darkBorder),
      labelStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.darkTextSecondary,
      ),
      secondaryLabelStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.onDarkAccent,
      ),
      checkmarkColor: AppColors.onDarkAccent,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkSurface,
      surfaceTintColor: Colors.transparent,
      modalBackgroundColor: AppColors.darkSurface,
      showDragHandle: true,
      dragHandleColor: AppColors.darkBorder,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.r24)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.darkSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.darkText,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkTextSecondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r24),
        side: const BorderSide(color: AppColors.darkBorder),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.darkSurfaceHigh,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.darkText,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.darkAccent,
      unselectedLabelColor: AppColors.darkTextMuted,
      indicatorColor: AppColors.darkAccent,
      dividerColor: AppColors.darkBorder,
      labelStyle: AppTextStyles.labelLarge,
      unselectedLabelStyle: AppTextStyles.labelLarge,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(AppColors.darkBackground),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.darkAccent
            : AppColors.darkSurfaceHigh,
      ),
      trackOutlineColor: const WidgetStatePropertyAll(AppColors.darkBorder),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.darkAccent,
      linearTrackColor: AppColors.darkSurfaceHigh,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkSurface,
      indicatorColor: AppColors.darkAccentContainer,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextStyles.labelMedium.copyWith(
          color: states.contains(WidgetState.selected)
              ? AppColors.darkAccent
              : AppColors.darkTextMuted,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.darkAccent
              : AppColors.darkTextMuted,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.darkText, size: 24),
  );
}
