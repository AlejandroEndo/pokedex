import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokedex/api/pokemon_api.dart';
import 'package:pokedex/models/generic.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/poke_cache.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonState with ChangeNotifier {
  PokemonApi api = PokemonApi();

  PokemonState() {
    // PokeCache.clearCache();
  }

  Future<AsyncSnapshot<List<dynamic>>> getPokemons() async {
    List<dynamic> _pokemons;
    List<Generic> pokemonCache = await PokeCache.getPokemons();
    if (pokemonCache.isEmpty) {
      Map<String, dynamic> result = await api.getPokemons();
      _pokemons =
          result['results'].map((i) => new Generic.fromJson(i)).toList();
      await PokeCache.setPokemons(_pokemons);
    } else {
      _pokemons = pokemonCache;
    }
    return AsyncSnapshot<List<dynamic>>.withData(
        ConnectionState.done, _pokemons);
  }

  Future<AsyncSnapshot<Pokemon>> getPokemonByUrl(String url) async {
    Pokemon pokemon;
    List<String> urlList = url.split('/');
    String id = urlList[urlList.length - 2];
    Pokemon cachedPokemon = await PokeCache.getPokemon(id);
    if (cachedPokemon == null) {
      Map<String, dynamic> result = await api.getPokemon(id);
      pokemon = Pokemon.fromJson(result);
      await PokeCache.setPokemon(id, pokemon);
    } else {
      pokemon = cachedPokemon;
    }
    return AsyncSnapshot<Pokemon>.withData(ConnectionState.done, pokemon);
  }

  Future<AsyncSnapshot<Map<String,dynamic>>> getPokemonSpecieById(int id) async {
    Map<String, dynamic> pokeComplement;
    String cachedPokemon = await PokeCache.getPokemonSpecie(id);
    if (cachedPokemon.isEmpty) {
      pokeComplement = await api.getPokemonSpecie(id);
      await PokeCache.setPokemonSpecie(id, pokeComplement);
    } else {
      pokeComplement = jsonDecode(cachedPokemon);
    }
    return AsyncSnapshot<Map<String,dynamic>>.withData(ConnectionState.done, pokeComplement);
  }

  Future<AsyncSnapshot<Response>> customSearch(String key, String url) async {
    Response response;
    // String jsonResult = await PokeCache.getString(key);
    // if (jsonResult.isEmpty) {
    response = await api.customSearch(url);
    // await PokeCache.setString(key, response.body);
    // } else {
    // response = Response(jsonResult, 200);
    // }
    return AsyncSnapshot<Response>.withData(ConnectionState.done, response);
  }
}
