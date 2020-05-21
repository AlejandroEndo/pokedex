class Pokemon {
  bool is_default;
  int id;
  int order;
  int weight;
  int height;
  int base_experience;
  String name;
  String location_area_encounters;
  List moves;
  List forms;
  List stats;
  List types;
  List abilities;
  List held_items;
  List game_indices;
  Map<String, dynamic> species;
  Map<String, dynamic> sprites;
  Pokemon({
    this.abilities,
    this.base_experience,
    this.forms,
    this.game_indices,
    this.height,
    this.held_items,
    this.id,
    this.is_default,
    this.location_area_encounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  Map toJson() => {
        'id': id,
        'name': name,
        'forms': forms,
        'moves': moves,
        'order': order,
        'stats': stats,
        'types': types,
        'height': height,
        'weight': weight,
        'species': species,
        'sprites': sprites,
        'abilities': abilities,
        'is_default': is_default,
        'held_items': held_items,
        'game_indices': game_indices,
        'base_experience': base_experience,
        'location_area_encounters': location_area_encounters,
      };

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      forms: json['forms'],
      moves: json['moves'],
      order: json['order'],
      stats: json['stats'],
      types: json['types'],
      weight: json['weight'],
      height: json['height'],
      species: json['species'],
      sprites: json['sprites'],
      abilities: json['abilities'],
      is_default: json['is_default'],
      held_items: json['held_items'],
      game_indices: json['game_indices'],
      base_experience: json['base_experience'],
      location_area_encounters: json['location_area_encounters'],
    );
  }
}
