library theme;

import 'package:flutter/material.dart';

part 'app_text_style.dart';
part 'asset_path.dart';
part 'color.dart';
part 'font.dart';

final ThemeData appTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = AppColor.primaryColor;
  const Color secondaryColor = AppColor.primaryColor;
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      error: AppColor.errorColor);
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    splashFactory: InkRipple.splashFactory,
    canvasColor: AppColor.white,
    cardColor: AppColor.white,
    scaffoldBackgroundColor: AppColor.white,
    listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
    snackBarTheme: SnackBarThemeData(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
      insetPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      padding: EdgeInsets.zero,
    )),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: AppColor.white,
        iconSize: 32),
    inputDecorationTheme: InputDecorationTheme(
        constraints: const BoxConstraints(
          minHeight: 50,
        ),
        fillColor: AppColor.inputFillColor,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.inputBorderColor),
            borderRadius: BorderRadius.circular(4)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.inputBorderColor),
            borderRadius: BorderRadius.circular(4)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor),
            borderRadius: BorderRadius.circular(4))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            backgroundColor: AppColor.white,
            foregroundColor: primaryColor,
            minimumSize: const Size(double.minPositive, 48),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.maxFinite, 50),
        elevation: 0,
        backgroundColor: secondaryColor,
        foregroundColor: AppColor.white,
        textStyle: AppTextStyle.fontWeight500(),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(2)),
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
    ),
  );
  return base;
}
