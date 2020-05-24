import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/utils/constants.dart' as Constants;

class PokemonApi {
  Future<Map<String, dynamic>> getPokemons() async {
    http.Response response = await http.get(Constants.POKE_API);
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<Map<String, dynamic>> getPokemon(int id) async {
    http.Response response = await http.get('${Constants.POKE_API}/$id');
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    return responseBody;
  }

  Future<Map<String, dynamic>> customSearch(String url) async {
    http.Response response = await http.get(url);
    Map<String, dynamic> responseBody = jsonDecode(response.body);
    return responseBody;
  }
}
