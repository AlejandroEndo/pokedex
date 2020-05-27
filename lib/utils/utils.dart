import 'package:flutter/cupertino.dart';
import 'package:pokedex/widgets/pokemon_type.dart';

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
  String pokedexFormat(int pokeid) {
    String converted = pokeid.toString();
    if (converted.length == 3) return '#$converted';
    return converted.length < 2 ? '#00$converted' : '#0$converted';
  }

  // Build the types widgets of a List<Map> of types
  List<Widget> buildTypes(List<dynamic> types) {
    List<Widget> _types = [];
    for (int i = 0; i < types.length; i++) {
      _types.insert(0, Pokemontype(type: types[i]['type']['name']));
    }
    return _types;
  }

  // Return the genra into the correct language.
  String getPokemonGeneraGenus(List genera, String language) {
    String genus = '';
    for (int i = 0; i < genera.length; i++) {
      if (genera[i]['language']['name'] == language) {
        genus = genera[i]['genus'];
        return genus;
      }
    }
    return genus;
  }

  // Return the FlavorText into the correct language.
  String getPokemonFlavorText(List flavorTextEntries, String language) {
    String flavorText = '';
    for (int i = 0; i < flavorTextEntries.length; i++) {
      if (flavorTextEntries[i]['language']['name'] == language) {
        flavorText = flavorTextEntries[i]['flavor_text'];
        flavorText = flavorText.replaceAll('\n', ' ');
        return flavorText;
      }
    }
    return flavorText;
  }

  // Convert decimeters to meters or foots.
  String decimeterParser(bool toFoots, double value) {
    double convertedValue = 0;
    if (toFoots) {
      convertedValue = (value / 10) * 3.281;
      String parsedValue =
          double.parse((convertedValue).toStringAsFixed(3)).toString();
      List<String> valueSplit = parsedValue.split('.');
      return '${valueSplit[0]}\'${valueSplit[1]}\"';
    } else {
      convertedValue = value / 10;
      return double.parse((convertedValue).toStringAsFixed(2)).toString();
    }
  }

  // Convert hectograms to kilograms or pounds.
  String hectogramParser(bool toPounds, double value) {
    double convertedValue = toPounds ? (value / 10) * 2.205 : value / 10;
    return double.parse((convertedValue).toStringAsFixed(2)).toString();
  }
}
