import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/main_header.dart';
import 'package:pokedex/widgets/pokemon_card.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/utils/constants.dart' as Constants;
import 'package:pokedex/providers/pokemon_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: http.get(Constants.POKE_API),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> res = jsonDecode(snapshot.data.body);
            return Container(
              color: Colors.white,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: MainHeader(
                      maxExtent: 250.0,
                      minExtent: 150.0,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return PokemonCard(
                          pokemonUrl: res['results'][index]['url'],
                        );
                      },
                      childCount: res['results'].length,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  // FutureBuilder<Response> _bodyBuilder(BuildContext context) {
  //   return FutureBuilder(
  //     // future: http.get('https://pokeapi.co/api/v2/pokemon?offset=0&limit=964'),
  //     future: http.get(Constants.POKE_API),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       if (snapshot.connectionState == ConnectionState.done) {
  //         Map<String, dynamic> res = jsonDecode(snapshot.data.body);
  //         return _buildPokemons(context, res['results']);
  //       } else {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }

  // _buildPokemons(BuildContext context, List<dynamic> pokemons) {
  //   return GridView.builder(
  //     itemCount: pokemons.length,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 3,
  //     ),
  //     itemBuilder: (BuildContext conttext, int index) {
  //       return PokemonCard(pokemonUrl: pokemons[index]['url']);
  //     },
  //   );
  // }
}
