import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/utils/constants.dart' as Constants;

class PokemonApi {
  Future<http.Response> getPokemons() async {
    http.Response response = await http.get(Constants.ALL_POKEMON_URL);
    return response;
  }

  Future<http.Response> getPokemon(String id) async {
    http.Response response = await http.get('${Constants.POKE_API}/$id');
    return response;
  }

  Future<http.Response> getPokemonSpecie(int id) async{
    http.Response response = await http.get('${Constants.POKE_SPECIES_API}/$id');
    return response;
  }

  Future<http.Response> customSearch(String url) async {
    http.Response response = await http.get(url);
    return response;
  }
}
