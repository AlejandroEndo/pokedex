import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon_page.dart';
import 'package:pokedex/utils/utils.dart';
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
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 8.0,
                      ),
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Constants.typeColor[defaultType],
                            Utils().darken(
                              Constants.typeColor[defaultType],
                              0.05,
                            ),
                          ],
                          stops: [0.0, 1.0],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Constants.typeColor[defaultType]
                                .withOpacity(0.3),
                            offset: Offset(0, -10),
                            blurRadius: 15.0,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => PokemonPage(
                                  pokemon: pokemon, defaultType: defaultType),
                            ),
                          ),
                          splashColor: Utils().lighten(
                            Constants.typeColor[defaultType],
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                bottom: 0.0,
                                right: 15.0,
                                width: 150,
                                height: 150,
                                child: SvgPicture.asset(
                                  Constants.ASSETS['flatBall'],
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                              Positioned(
                                bottom: MediaQuery.of(context).size.width / 15,
                                left: 150.0,
                                width: MediaQuery.of(context).size.width / 5,
                                height: MediaQuery.of(context).size.width / 5,
                                child: SvgPicture.asset(
                                  Constants.ASSETS['dots'],
                                  color: Colors.white,
                                ),
                              ),
                              Positioned(
                                top: 15.0,
                                bottom: 10.0,
                                left: 20.0,
                                right: 20.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      Utils().pokedexFormat(pokemon.id),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      Utils().capitalize(pokemon.name),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children:
                                          Utils().buildTypes(pokemon.types),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 15.0,
                    top: 0.0,
                    child: Container(
                      height: 150.0,
                      child: Hero(
                        tag: pokemon.id,
                        child: CachedNetworkImage(
                          fit: BoxFit.contain,
                          imageUrl: '${Constants.POKERES}/${pokemon.id}.png',
                          // imageUrl: widget.pokemon.sprites['front_default'] ??
                          //     'https://i.pinimg.com/236x/95/d5/cd/95d5cded00f3a3e8a98fb1eed568aa9f--sticker-vinyl-car-decals.jpg',
                          placeholder: (context, url) =>
                              new CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              new Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
