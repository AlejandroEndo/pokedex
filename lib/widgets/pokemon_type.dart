import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokedex/utils/constants.dart' as Constants;

class Pokemontype extends StatelessWidget {
  final String type;
  Pokemontype({Key key, @required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Constants.TYPE_COLOR[type],
        borderRadius: BorderRadius.all(Radius.circular(5.0),
        ),
        border: Border.all(
          color: Colors.transparent
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svg/types_logos/$type.svg',
            width: 12.0,
            height: 12.0,
          ),
          SizedBox(width: 5.0),
          Text(
            type,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
