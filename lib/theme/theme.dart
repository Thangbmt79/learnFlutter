import 'package:firstflutter/theme/color.dart';
import 'package:firstflutter/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = _themeData;
  static ThemeColor color = ThemeColor();
  static CustomTextStyle text = CustomTextStyle();
}

final _themeData = ThemeData(
  primaryColor: ThemeColor.primary,
  fontFamily: 'Lato',
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white,
  ),
  scaffoldBackgroundColor: ThemeColor.grey200,
  indicatorColor: ThemeColor.success,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: ThemeColor.textPrimary),
    titleTextStyle: CustomTextStyle.h3,
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: ThemeColor.primary,
    secondary: ThemeColor.secondary,
  ),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    crossAxisMargin: -8,
    thumbColor: MaterialStateProperty.all(ThemeColor.darkPrimary),
    radius: const Radius.circular(3),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.transparent;
      }
      return ThemeColor.grey600;
    }),
    checkColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return Colors.white;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3.0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: CustomTextStyle.body2.copyWith(
      color: ThemeColor.grey400,
    ),
    labelStyle: MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      return TextStyle(
        color: states.contains(MaterialState.error)
            ? ThemeColor.danger
            : ThemeColor.textPrimary,
        fontSize: 18,
      );
    }),
    floatingLabelStyle:
        MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
      return TextStyle(
        color: states.contains(MaterialState.error)
            ? ThemeColor.danger
            : ThemeColor.textPrimary,
        fontSize: 18,
      );
    }),
    alignLabelWithHint: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 15,
    ),
    fillColor: ThemeColor.white,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: ThemeColor.grey300,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: ThemeColor.grey300,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: 1,
        color: ThemeColor.grey300,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    filled: true,
    isDense: true,
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ThemeColor.danger,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: ThemeColor.danger,
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    errorStyle: TextStyle(
      color: ThemeColor.danger,
    ),
  ),
  bottomAppBarTheme: const BottomAppBarTheme(color: ThemeColor.white),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(backgroundColor: Colors.white),
);

class TColor {
  Color primary;
  Color secondary;
  TColor({
    this.primary = Colors.red,
    this.secondary = Colors.red,
  });
}
