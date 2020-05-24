import 'package:flutter/material.dart';
import 'package:pokedex/pages/home_page.dart';
import 'package:pokedex/providers/pokemon_state.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: PokemonState()),
      ],
      child: MaterialApp(
        title: 'Pokedex',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
