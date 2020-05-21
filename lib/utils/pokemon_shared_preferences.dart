import 'dart:convert';

import 'package:pokedex/models/pokemon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokeCache {
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