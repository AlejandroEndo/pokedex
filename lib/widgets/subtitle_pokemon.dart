import 'package:flutter/material.dart';

import 'package:pokedex/utils/constants.dart' as Constants;

class SubtitlePokemon extends StatelessWidget {
  final String text;
  final String defaultType;
  SubtitlePokemon(this.text, {@required this.defaultType});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Constants.TYPE_COLOR[defaultType],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
