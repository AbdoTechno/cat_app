import 'package:material_ui/material_ui.dart';

import 'app_colors.dart';
import 'app_sizes.dart';
import 'app_text_styles.dart';

ThemeData get lightTheme {
  OutlineInputBorder inputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.r12),
      borderSide: BorderSide(color: color),
    );
  }

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    canvasColor: AppColors.lightBackground,
    textTheme: AppTextStyles.textTheme(AppColors.lightText),
    splashFactory: NoSplash.splashFactory,
    dividerColor: AppColors.lightBorder,
    colorScheme: ColorScheme.light(
      primary: AppColors.accent,
      onPrimary: AppColors.onAccent,
      primaryContainer: AppColors.lightAccentContainer,
      onPrimaryContainer: AppColors.lightText,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onAccent,
      secondaryContainer: AppColors.lightSecondaryContainer,
      onSecondaryContainer: AppColors.lightText,
      error: AppColors.danger,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
      outline: AppColors.lightBorder,
      surfaceContainerHighest: AppColors.lightSurfaceHigh,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.lightText,
      ),
      iconTheme: IconThemeData(color: AppColors.lightText, size: 24),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightSurface,
      elevation: 0,
      margin: EdgeInsets.zero,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r16),
        side: const BorderSide(color: AppColors.lightBorder),
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.lightBorder,
      thickness: 1,
      space: 1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: AppColors.onAccent,
        disabledBackgroundColor: AppColors.lightSurfaceHigh,
        disabledForegroundColor: AppColors.lightDisabled,
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
        foregroundColor: AppColors.accent,
        disabledForegroundColor: AppColors.lightDisabled,
        minimumSize: Size.fromHeight(AppSizes.buttonHeight),
        side: const BorderSide(color: AppColors.lightBorder),
        textStyle: AppTextStyles.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accent,
        disabledForegroundColor: AppColors.lightDisabled,
        minimumSize: Size(AppSizes.iconExtraLarge, AppSizes.iconExtraLarge),
        textStyle: AppTextStyles.labelLarge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r12),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSurface,
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppSizes.p16,
        vertical: AppSizes.p16,
      ),
      hintStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextMuted,
      ),
      labelStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextSecondary,
      ),
      errorStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.danger),
      border: inputBorder(AppColors.lightBorder),
      enabledBorder: inputBorder(AppColors.lightBorder),
      focusedBorder: inputBorder(AppColors.accent),
      errorBorder: inputBorder(AppColors.danger),
      focusedErrorBorder: inputBorder(AppColors.danger),
      disabledBorder: inputBorder(AppColors.lightBorder),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.lightSurface,
      selectedColor: AppColors.accent,
      disabledColor: AppColors.lightSurfaceRaised,
      side: const BorderSide(color: AppColors.lightBorder),
      labelStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.lightTextSecondary,
      ),
      secondaryLabelStyle: AppTextStyles.bodySmall.copyWith(
        color: AppColors.onAccent,
      ),
      checkmarkColor: AppColors.onAccent,
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.lightSurface,
      surfaceTintColor: Colors.transparent,
      modalBackgroundColor: AppColors.lightSurface,
      showDragHandle: true,
      dragHandleColor: AppColors.lightBorder,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.r24)),
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.lightSurface,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: AppTextStyles.titleLarge.copyWith(
        color: AppColors.lightText,
      ),
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightTextSecondary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r24),
        side: const BorderSide(color: AppColors.lightBorder),
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.lightSurfaceHigh,
      contentTextStyle: AppTextStyles.bodyMedium.copyWith(
        color: AppColors.lightText,
      ),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.r12),
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: AppColors.accent,
      unselectedLabelColor: AppColors.lightTextMuted,
      indicatorColor: AppColors.accent,
      dividerColor: AppColors.lightBorder,
      labelStyle: AppTextStyles.labelLarge,
      unselectedLabelStyle: AppTextStyles.labelLarge,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: const WidgetStatePropertyAll(AppColors.lightSurface),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected)
            ? AppColors.accent
            : AppColors.lightSurfaceHigh,
      ),
      trackOutlineColor: const WidgetStatePropertyAll(AppColors.lightBorder),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.accent,
      linearTrackColor: AppColors.lightSurfaceHigh,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.lightSurface,
      indicatorColor: AppColors.lightAccentContainer,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => AppTextStyles.labelMedium.copyWith(
          color: states.contains(WidgetState.selected)
              ? AppColors.accent
              : AppColors.lightTextMuted,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected)
              ? AppColors.accent
              : AppColors.lightTextMuted,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.lightText, size: 24),
  );
}
