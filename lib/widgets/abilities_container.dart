import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/providers/pokemon_state.dart';
import 'package:pokedex/utils/column_builder.dart';
import 'package:provider/provider.dart';

class AbilitiesContainer extends StatelessWidget {
  final List abilities;
  AbilitiesContainer({@required this.abilities});
  @override
  Widget build(BuildContext context) {
    print(abilities);
    return ColumnBuilder(
      itemCount: abilities.length,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      itemBuilder: (BuildContext context, int index) {
        return FutureBuilder(
          future: context.watch<PokemonState>().customSearch(
                abilities[index]['ability']['name'],
                abilities[index]['ability']['url'],
              ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> res = jsonDecode(snapshot.data.data.body);
              String shortEffect = res['effect_entries'][0]['short_effect'];
              bool isHiden = abilities[index]['is_hidden'];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('${index+1}. ${res['name']}', style: TextStyle(fontWeight: FontWeight.w500),),
                    Text(
                        '$shortEffect ${isHiden ? '(hidden ability)' : ''}'),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}
