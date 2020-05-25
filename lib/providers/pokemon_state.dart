import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokedex/api/pokemon_api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/poke_cache.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonState with ChangeNotifier {
  PokemonApi api = PokemonApi();

  PokemonState() {
    PokeCache.clearCache();
  }

  Future<AsyncSnapshot<Response>> getPokemons() async {
    Response response;
    String jsonResult = await PokeCache.getPokemons();
    if (jsonResult.isEmpty) {
      response = await api.getPokemons();
      await PokeCache.setPokemons(response.body);
    } else {
      response = Response(jsonResult, 200);
    }
    return AsyncSnapshot<Response>.withData(ConnectionState.done, response);
  }

  Future<AsyncSnapshot<Response>> getPokemon(String url) async {
    Response response;
    List<String> urlList = url.split('/');
    String id = urlList[urlList.length - 2];
    String jsonResult = await PokeCache.getPokemon(id);
    if (jsonResult.isEmpty) {
      response = await api.getPokemon(id);
      await PokeCache.setPokemon(id, response.body);
    } else {
      response = Response(jsonResult, 200);
    }
    return AsyncSnapshot<Response>.withData(ConnectionState.done, response);
  }
//
  // Future<Pokemon> getPokemon(int id)async{
  //   Map<String,dynamic>result = await api.getPokemon(id);
  //   Pokemon pokemon = Pokemon.fromJson(result);
  //   notifyListeners();
  //   return pokemon;
  // }
//
  // Future<Pokemon> getPokemon(String url)async{
  //   Map<String, dynamic> result = await api.customSearch(url);
  //   Pokemon pokemon = Pokemon.fromJson(result);
  // return pokemon;
  // }
//
  // Future<Pokemon> buildPokemonList(Map<String, dynamic>pokeData)async{
  // String token = await PokeCache.getPokemon(pokeData['']);
  // }
}
