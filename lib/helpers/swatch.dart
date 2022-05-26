import 'package:flutter/material.dart';
import 'package:chucknorris/helpers/palette.dart';

class Swatch {
  static MaterialColor colorScheme() {
    const int flamingo = 0xFFf15a24;
    const MaterialColor flamingoMC = MaterialColor(
      flamingo,
      <int, Color>{
        50: Palette.flamingo,
        100: Palette.flamingo,
        200: Palette.flamingo,
        300: Palette.flamingo,
        400: Palette.flamingo,
        500: Color(flamingo),
        600: Palette.flamingo,
        700: Palette.flamingo,
        800: Palette.flamingo,
        900: Palette.flamingo,
      },
    );
    return flamingoMC;
  }
}
