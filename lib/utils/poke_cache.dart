import 'dart:convert';

import 'package:pokedex/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokeCache {
  static Future<void> clearCache() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    return null;
  }

  static Future<void> setPokemons(String pokemons) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('pokemons', pokemons);
    return null;
  }

  static Future<String> getPokemons() async {
    final preferences = await SharedPreferences.getInstance();
    String result = preferences.getString('pokemons') ?? '';
    return result;
  }

  static Future<void> setPokemon(String id, String data) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(id, data);
    return null;
  }

  static Future<String> getPokemon(String id) async {
    final preferences = await SharedPreferences.getInstance();
    String pokejson = preferences.getString(id) ?? '';
    return pokejson;
  }

  static Future<void> setPokemonSpecie(int id, String data) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('specie_$id', data);
    return null;
  }

  static Future<String> getPokemonSpecie(int id) async {
    final preferences = await SharedPreferences.getInstance();
    String pokejson = preferences.getString('specie_$id') ?? '';
    return pokejson;
  }
}
