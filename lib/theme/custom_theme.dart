import 'package:flutter/material.dart';
import 'package:movies_rating_app_flutter/theme/palette.dart';

class CustomTheme {
  static ThemeData darkTheme(BuildContext context) {
    final theme = Theme.of(context);
    final headlineColor = TextStyle(color: Colors.white);
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(
          Palette.red500.value,
          const {
            100: Palette.red100,
            200: Palette.red200,
            300: Palette.red300,
            400: Palette.red400,
            500: Palette.red500,
            600: Palette.red600,
            700: Palette.red700,
            800: Palette.red800,
            900: Palette.red900,
          },
        ),
        accentColor: Palette.red500,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: Palette.almostBlack,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Palette.almostBlack,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color.fromARGB(196, 255, 255, 255),
        inactiveTrackColor: Colors.grey.shade800,
        thumbColor: Colors.white,
        valueIndicatorColor: Colors.grey.shade800,
        valueIndicatorTextStyle: TextStyle(
            //color: Palette.almostBlack,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        inactiveTickMarkColor: Colors.transparent,
        activeTickMarkColor: Colors.transparent,
      ),
      textTheme: theme.primaryTextTheme.copyWith(
        labelLarge: theme.primaryTextTheme.labelLarge?.copyWith(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: headlineColor,
        headlineMedium: headlineColor,
        headlineSmall: headlineColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Palette.red500,
        ),
      ),
      useMaterial3: true,
    );
  }
}
