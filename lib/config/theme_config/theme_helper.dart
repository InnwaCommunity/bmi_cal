
import 'package:flutter/material.dart';



bool isDarkTheme(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

ThemeData kLightTheme=ThemeData(
  colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFF063AB5),
      primaryContainer: const Color(0xFF3d83ff),
      secondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFF272727),
      onBackground: const Color(0xFFFFFFFF),
      surface: const Color(0xFFFFFFFF),
      onSecondary: HexColor('#FFFFFF'),
      onSecondaryContainer: HexColor('#204183c4'),
      onPrimary: const Color(0xFFFAFAFA),
      tertiary: const Color(0xFFE2E2E2),
      onTertiaryContainer: const Color(0xFFCECECE),
      brightness: Brightness.light),
);

ThemeData kDarkTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFF151a30),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xFF1a1f38),
    primaryContainer: const Color(0xFF3d83ff),
    secondary: const Color(0xFF151a30),
    secondaryContainer: const Color(0xFFFEFEFE),
    onBackground: const Color(0xFF151a30),
    surface: const Color(0xFFFFFFFF),
    onSecondary: HexColor('#151a30'),
    onSecondaryContainer: HexColor('#30385D'),
    onPrimary: HexColor('#30385D'),
    tertiary: const Color(0xFF1a1f38),
    onTertiaryContainer: const Color(0xFF1A1F38),
    brightness: Brightness.dark,
  ),
);

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}