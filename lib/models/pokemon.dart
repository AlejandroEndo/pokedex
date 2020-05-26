class Pokemon {
  bool is_default;
  int id;
  int order;
  int weight;
  int height;
  int base_experience;
  String url;
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
  // SPECIES
  List flavor_text_entries;
  Map<String, dynamic> evolution_chain;
  Map<String, dynamic> evolves_from_species;
  List genera;
  Map<String, dynamic> generation;
  Map<String, dynamic> growth_rate;
  Map<String, dynamic> habitat;
  int base_happiness;
  int capture_rate;
  Pokemon({
    this.id,
    this.url,
    this.name,
    this.moves,
    this.forms,
    this.order,
    this.stats,
    this.types,
    this.genera,
    this.weight,
    this.height,
    this.species,
    this.habitat,
    this.sprites,
    this.abilities,
    this.held_items,
    this.is_default,
    this.generation,
    this.growth_rate,
    this.game_indices,
    this.capture_rate,
    this.base_happiness,
    this.base_experience,
    this.evolution_chain,
    this.flavor_text_entries,
    this.evolves_from_species,
    this.location_area_encounters,
  });

  Map toJson() => {
        'id': id,
        'url': url,
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
      url: json['url'],
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

  factory Pokemon.specieFromJson(Map<String, dynamic> json, Pokemon pokemon) {
    pokemon
      ..genera = json['genera']
      ..habitat = json['habitat']
      ..generation = json['generation']
      ..growth_rate = json['growth_rate']
      ..capture_rate = json['capture_rate']
      ..base_happiness = json['base_happiness']
      ..evolution_chain = json['evolution_chain']
      ..flavor_text_entries = json['flavor_text_entries']
      ..evolves_from_species = json['evolves_from_species'];
    return pokemon;
  }
}
