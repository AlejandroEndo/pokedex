import 'package:flutter/material.dart';
import 'package:pokedex/api/pokemon_api.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:provider/provider.dart';

class PokemonState with ChangeNotifier{
  PokemonApi api = PokemonApi();
  List<Pokemon> _pokemons;
  List<Pokemon> get pokemons => _pokemons;

  PokemonState(
  );

  // Future<void>getPokemons()async{
    // Map<String, dynamic> result = api.
  // }
}