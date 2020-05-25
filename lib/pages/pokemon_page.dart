import 'package:bordered_text/bordered_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon.dart';

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
              left: 8.0,
              top: 60.0,
              width: 130.0,
              height: 130.0,
              child: SvgPicture.asset(
                'assets/svg/types_logos/${widget.defaultType}.svg',
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Positioned(
              top: 0.0,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Hero(
                tag: widget.pokemon.id,
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: '${Constants.POKERES}/${widget.pokemon.id}.png',
                  // imageUrl: widget.pokemon.sprites['front_default'] ??
                  //     'https://i.pinimg.com/236x/95/d5/cd/95d5cded00f3a3e8a98fb1eed568aa9f--sticker-vinyl-car-decals.jpg',
                  placeholder: (context, url) =>
                      new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
            Positioned(
              top: 0,
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Utils().pokedexFormat(widget.pokemon.id),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        Utils().capitalize(widget.pokemon.name),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: Utils().buildTypes(widget.pokemon.types),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              height: (MediaQuery.of(context).size.height / 3) * 2,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: ListView(
                  children: <Widget>[
                    //  Text(widget.pokemon.),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
