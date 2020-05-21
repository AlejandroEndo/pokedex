import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/providers/pokemon_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyBuilder(context),
    );
  }

  FutureBuilder<Response> _bodyBuilder(BuildContext context) {
    return FutureBuilder(
      future: context.watch<PokemonState>().getPokemons(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> result = json.decode(snapshot.data.bodyString);
          final List pokemons = result['results'];
          return _buildPokemons(context, pokemons);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _buildPokemons(BuildContext context, List pokemons) {
    return GridView.builder(
      itemCount: pokemons.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext conttext, int index) {
        return Card(
          child: GridTile(
            footer: Text(pokemons[index]['name']),
            child: Icon(Icons.ac_unit),
          ),
        );
      },
    );
  }
}
