import 'dart:convert';

import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/pokemon_state.dart';
import 'package:pokedex/widgets/pokemon_content.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/utils/constants.dart' as Constants;
import 'package:pokedex/utils/utils.dart';

class PokemonPage extends StatefulWidget {
  Pokemon pokemon;
  String defaultType;
  PokemonPage({
    Key key,
    @required this.pokemon,
    @required this.defaultType,
  }) : super(key: key);
  @override
  _PokemonPageState createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Constants.typeColor[widget.defaultType],
              Utils().darken(
                Constants.typeColor[widget.defaultType],
                0.2,
              ),
            ],
            stops: [0.0, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.center,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50.0,
              child: Text(
                Utils().capitalize(widget.pokemon.name),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 150.0,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                      stops: [0.0, 1.0],
                      colors: <Color>[
                        Constants.typeColor[widget.defaultType],
                        Utils().lighten(
                            Constants.typeColor[widget.defaultType], 0.1),
                      ],
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                ),
              ),
            ),
            Positioned(
              right: 0.0,
              top: 100.0,
              width: 100.0,
              height: 100.0,
              child: SvgPicture.asset(
                Constants.ASSETS['dots'],
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 0.0,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: SvgPicture.asset(
                  'assets/svg/types_logos/${widget.defaultType}.svg',
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Hero(
                  tag: widget.pokemon.id,
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: '${Constants.POKERES}/${widget.pokemon.id}.png',
                    placeholder: (context, url) =>
                        new CircularProgressIndicator(),
                    errorWidget: (context, url, error) => new Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              height: (MediaQuery.of(context).size.height / 3) * 2,
              width: MediaQuery.of(context).size.width,
              child: PokemonContent(
                defaultType: widget.defaultType,
                pokemon: widget.pokemon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
