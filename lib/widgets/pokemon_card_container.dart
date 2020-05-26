import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/pages/pokemon_page.dart';

import 'package:pokedex/utils/constants.dart' as Constants;
import 'package:pokedex/utils/utils.dart';

class PokemonCardContainer extends StatefulWidget {
  final Pokemon pokemon;
  final String defaultType;
  PokemonCardContainer({
    Key key,
    @required this.defaultType,
    @required this.pokemon,
  }) : super(key: key);
  @override
  _PokemonCardContainerState createState() => _PokemonCardContainerState();
}

class _PokemonCardContainerState extends State<PokemonCardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 8.0,
      ),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Constants.typeColor[widget.defaultType],
            Utils().darken(
              Constants.typeColor[widget.defaultType],
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
            color: Constants.typeColor[widget.defaultType].withOpacity(0.3),
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
              builder: (_) =>
                  PokemonPage(pokemon: widget.pokemon, defaultType: widget.defaultType),
            ),
          ),
          splashColor: Utils().lighten(
            Constants.typeColor[widget.defaultType],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
