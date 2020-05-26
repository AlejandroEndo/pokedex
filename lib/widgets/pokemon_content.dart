import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_state.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/utils/constants.dart' as Constants;

class PokemonContent extends StatefulWidget {
  final Pokemon pokemon;
  final String defaultType;
  PokemonContent({
    Key key,
    @required this.pokemon,
    @required this.defaultType,
  }) : super(key: key);
  @override
  _PokemonContentState createState() => _PokemonContentState();
}

class _PokemonContentState extends State<PokemonContent> {
  Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: FutureBuilder(
        future: context
            .watch<PokemonState>()
            .getPokemonSpecieById(widget.pokemon.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> res = jsonDecode(snapshot.data.data.body);
            pokemon = Pokemon.specieFromJson(res, widget.pokemon);
            return ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    Utils().capitalize(pokemon.name),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Constants.typeColor[widget.defaultType],
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    '${Utils().pokedexFormat(pokemon.id)} | ${Utils().getPokemonGeneraGenus(pokemon.genera, 'en')}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: Utils().buildTypes(pokemon.types),
                ),
                Text(
                    Utils().getPokemonFlavorText(
                        pokemon.flavor_text_entries, 'en'),
                  ),
                // Container(
                //   width: MediaQuery.of(context).size.width / 2,
                //   child: 
                // ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
