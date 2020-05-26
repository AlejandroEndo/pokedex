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

  Future<AsyncSnapshot<Response>> getPokemonByUrl(String url) async {
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

  Future<AsyncSnapshot<Response>> getPokemonSpecieById(int id) async {
    Response response;
    String jsonResult = await PokeCache.getPokemonSpecie(id);
    if (jsonResult.isEmpty) {
      response = await api.getPokemonSpecie(id);
      await PokeCache.setPokemonSpecie(id, response.body);
    } else {
      response = Response(jsonResult, 200);
    }
    return AsyncSnapshot<Response>.withData(ConnectionState.done, response);
  }
}
