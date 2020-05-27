import 'dart:convert';

import 'package:pokedex/models/generic.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokeCache {
  static Future<void> setString(String key, String value) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(key, value);
    return null;
  }

  static Future<String> getString(String key) async {
    final preferences = await SharedPreferences.getInstance();
    String value = preferences.getString(key) ?? '';
    return value;
  }

  static Future<void> clearCache() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return null;
  }

  static Future<void> setPokemons(List<dynamic> pokemons) async {
    final preferences = await SharedPreferences.getInstance();
    String data = jsonEncode(pokemons);
    await preferences.setString('pokemons', data);
    return null;
  }

  static Future<List<Generic>> getPokemons() async {
    final preferences = await SharedPreferences.getInstance();
    String result = preferences.getString('pokemons') ?? '';
    if (result.isEmpty)
      return [];
    else {
      List<dynamic> pokemons = jsonDecode(result);
      List<Generic> genericPokemons =
          pokemons.map((i) => Generic.fromJson(i)).toList();
      return genericPokemons;
    }
  }

  static Future<void> setPokemon(String id, Pokemon pokemon) async {
    final preferences = await SharedPreferences.getInstance();
    String data = jsonEncode(pokemon);
    await preferences.setString(id, data);
    return null;
  }

  static Future<Pokemon> getPokemon(String id) async {
    final preferences = await SharedPreferences.getInstance();
    String result = preferences.getString(id) ?? '';
    if (result.isEmpty)
      return null;
    else {
      Map<String, dynamic> pokeJson = jsonDecode(result);
      Pokemon pokemon = Pokemon.fromJson(pokeJson);
      return pokemon;
    }
  }

  static Future<void> setPokemonSpecie(
      int id, Map<String, dynamic> pokeComplement) async {
    final preferences = await SharedPreferences.getInstance();
    String data = jsonEncode(pokeComplement);
    await preferences.setString('specie_$id', data);
    return null;
  }

  static Future<String> getPokemonSpecie(int id) async {
    final preferences = await SharedPreferences.getInstance();
    String pokejson = preferences.getString('specie_$id') ?? '';
    return pokejson;
  }
}
