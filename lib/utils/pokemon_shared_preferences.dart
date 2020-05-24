import 'dart:convert';

import 'package:pokedex/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokeCache {

  static Future<void> setPokemon(Pokemon pokemon)async{
    final preferences = await SharedPreferences.getInstance();
    String pokejson = jsonEncode(pokemon);
    await preferences.setString('${pokemon.id}', pokejson);
  }

  static Future<Pokemon> getPokemon(int id)async{
    final preferences = await SharedPreferences.getInstance();
    String pokejson = preferences.getString('$id') ?? '';
    if(pokejson.isEmpty) return null;
    Map<String, dynamic> pokeMap = jsonDecode(pokejson);
    Pokemon pokemon = Pokemon.fromJson(pokeMap);
    return pokemon;
  }

  static Future<bool> setToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("token", token);
    return true;
  }

  static Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    final String token = preferences.getString("token") ?? "";
    return token;
  }

  static Future<bool> deleteToken() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove("token");
    return true;
  }

  // static Future<Pokemon>
}