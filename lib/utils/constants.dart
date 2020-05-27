library constants;

import 'package:flutter/material.dart';

const String POKEDEX = 'Pokédex';
const String POKEDEX_CONTENT =
    'Search for Pokémon by name or using the national Pokédex number.';
const String SEARCH_HINT = 'What Pokémon are you looking for?';
const String ABOUT_SUBTITLE_1 = 'Pokédex Data';
const String ABOUT_SUBTITLE_2 = 'Training';

const Map<String, Color> TYPE_COLOR = {
  'dark': Color(0xff705746),
  'dragon': Color(0xff6f35fc),
  'electric': Color(0xfff7d02c),
  'fairy': Color(0xffd685ad),
  'fighting': Color(0xffc22e28),
  'fire': Color(0xffee8130),
  'flying': Color(0xffa98ff3),
  'ghost': Color(0xff735797),
  'grass': Color(0xff7ac74c),
  'ground': Color(0xffe2bf65),
  'ice': Color(0xff96d9d6),
  'normal': Color(0xffa8a77a),
  'psychic': Color(0xfff95587),
  'rock': Color(0xffb6a136),
  'steel': Color(0xffb7b7ce),
  'water': Color(0xff6390f0),
  'bug': Color(0xff97c42d),
  'poison':Color(0xffb964cc),
};

const Map<String, String> ASSETS = {
  'flatBall':'assets/svg/flat_ball.svg',
  'dots':'assets/svg/dots.svg',
};

const String URL = 'https://pokeapi.co/api/v2';
const String POKE_API = '$URL/pokemon';
const String ALL_POKEMON_URL = '$POKE_API?limit=807&offset=0';
const String POKE_SPECIES_API = '$URL/pokemon-species';
const String POKERES = 'https://pokeres.bastionbot.org/images/pokemon';

