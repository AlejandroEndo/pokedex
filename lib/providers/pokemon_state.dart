import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokedex/api/pokemon_api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/utils/pokemon_shared_preferences.dart';
import 'package:provider/provider.dart';

class PokemonState with ChangeNotifier {
  // PokemonApi api = PokemonApi();
  // List<Pokemon> _pokemons;
  // List<Pokemon> get pokemons => _pokemons;

  // List<dynamic> _pokemons;
  // List<dynamic> get pokemons => _pokemons;

  // PokemonState();

  // Future<Response> getPokemons() async {
  //   Map<String, dynamic> result = await api.getPokemons();
  //   _pokemons = result['results'].map((i) => new Pokemon.fromJson(i)).toList();
  //   notifyListeners();
  //   return Response(result['results'], 200);
  // }
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
