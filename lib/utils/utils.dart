import 'package:flutter/cupertino.dart';

class Utils {
  // Return a darker color.
  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  // Return a lighter color.
  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  // Capitalize the first index of string.
  String capitalize(String text) {
    return "${text[0].toUpperCase()}${text.substring(1)}";
  }

  // set the 0s on int and return it as a string.
  String pokedexFormat(int pokeid){
    String converted = pokeid.toString();
    if(converted.length == 3) return '#converted';
    return converted.length < 2 ? '#00$converted' : '#0$converted';
  }
}
