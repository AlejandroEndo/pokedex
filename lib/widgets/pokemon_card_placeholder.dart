import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/utils/constants.dart' as Constants;
import 'package:pokedex/utils/utils.dart';

class PokemonCardPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Constants.typeColor['steel'],
                    Utils().darken(
                      Constants.typeColor['steel'],
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
                    color: Constants.typeColor['steel'].withOpacity(0.3),
                    offset: Offset(0, -10),
                    blurRadius: 15.0,
                    spreadRadius: 5,
                  ),
                ],
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
                          '#000',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '???',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 15.0,
            top: 0.0,
            child: Container(
              height: 150.0,
              child: Image.asset(
                'assets/img/poke_holder.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
