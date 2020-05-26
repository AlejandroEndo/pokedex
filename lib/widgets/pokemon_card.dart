import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon_page.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/pokemon_card_container.dart';
import 'package:pokedex/widgets/pokemon_card_placeholder.dart';
import 'package:pokedex/widgets/pokemon_type.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/providers/pokemon_state.dart';
import 'package:http/http.dart' as http;

import 'package:pokedex/utils/constants.dart' as Constants;

class PokemonCard extends StatefulWidget {
  final String pokemonUrl;
  PokemonCard({Key key, @required this.pokemonUrl}) : super(key: key);
  @override
  _PokemonCardState createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  Pokemon pokemon;
  String defaultType;
  Color color;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context
          .watch<PokemonState>()
          .getPokemon(widget.pokemonUrl), //http.get(widget.pokemonUrl),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> res = jsonDecode(snapshot.data.data.body);
          pokemon = Pokemon.fromJson(res);
          defaultType = pokemon.types[pokemon.types.length - 1]['type']['name'];
          return Material(
            color: Colors.transparent,
            child: Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 50,
                    height: 150.0,
                    width: MediaQuery.of(context).size.width,
                    child: PokemonCardContainer(
                      pokemon: pokemon,
                      defaultType: defaultType,
                    ),
                  ),
                  Positioned(
                    right: 15.0,
                    top: 0.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => PokemonPage(
                                pokemon: pokemon, defaultType: defaultType),
                          ),
                        );
                      },
                      child: Container(
                        height: 150.0,
                        child: Hero(
                          tag: pokemon.id,
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            imageUrl: '${Constants.POKERES}/${pokemon.id}.png',
                            placeholder: (context, url) => new Image.asset(
                              'assets/img/poke_holder.png',
                              fit: BoxFit.fill,
                            ),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: PokemonCardPlaceholder());
        }
      },
    );
  }
}
