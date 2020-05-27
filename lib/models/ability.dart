import 'package:pokedex/models/generic.dart';

class Ability {
  int id;
  String name;
  String effect;
  Generic generation;
  String short_effect;
  // List effect_changes;
  Ability({
    this.id,
    this.name,
    this.effect,
    this.generation,
    this.short_effect,
    // this.effect_changes,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'effect': effect,
        'generation': generation,
        'short_effect': short_effect,
        // 'effect_changes': effect_changes,
      };

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(
      id: json['id'],
      name: json['name'],
      effect: json['effect_entries'][0]['effect'],
      short_effect: json['effect_entries'][0]['short_effect'],
      generation: Generic.fromJson(json['generation']),
      // effect_changes: json['effect_changes'],
    );
  }
}
