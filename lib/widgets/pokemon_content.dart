import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_state.dart';
import 'package:pokedex/utils/utils.dart';
import 'package:pokedex/widgets/abilities_container.dart';
import 'package:pokedex/widgets/row_table.dart';
import 'package:pokedex/widgets/subtitle_pokemon.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: FutureBuilder(
        future: context
            .watch<PokemonState>()
            .getPokemonSpecieById(widget.pokemon.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            pokemon =
                Pokemon.specieFromJson(snapshot.data.data, widget.pokemon);
            return ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    Utils().getPokemonFlavorText(
                        pokemon.flavor_text_entries, 'en'),
                  ),
                ),
                SubtitlePokemon(
                  Constants.ABOUT_SUBTITLE_1,
                  defaultType: widget.defaultType,
                ),
                RowTable(
                  title: 'Species',
                  child: Text(
                    Utils().getPokemonGeneraGenus(pokemon.genera, 'en'),
                  ),
                ),
                RowTable(
                  title: 'Height',
                  child: Text(
                    "${Utils().decimeterParser(false, pokemon.height.toDouble())}m (${Utils().decimeterParser(true, pokemon.height.toDouble())})",
                  ),
                ),
                RowTable(
                  title: 'Weight',
                  child: Text(
                    "${Utils().hectogramParser(false, pokemon.weight.toDouble())}kg ${Utils().hectogramParser(true, pokemon.weight.toDouble())}lbs",
                  ),
                ),
                RowTable(
                  title: 'Abilities',
                  child: AbilitiesContainer(abilities: pokemon.abilities),
                ),
                RowTable(
                  title: 'Weaknesses',
                  child: Text(
                    Utils().getPokemonGeneraGenus(pokemon.genera, 'en'),
                  ),
                ),
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
