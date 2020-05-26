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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: context.watch<PokemonState>().getPokemons(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> res = jsonDecode(snapshot.data.data.body);
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: CustomScrollView(
                controller: scrollController,
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
}
