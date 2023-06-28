class Pokemon {
  String? name;
  String? url;
  List<Ability>? abilities;
  int? baseExperience;
  Sprites? sprite;
  int? height;
  List<String>? types;

  Pokemon(
      {this.name,
      this.url,
      this.abilities,
      this.baseExperience,
      this.sprite,
      this.height,
      this.types});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    if (json['abilities'] != null) {
      abilities = <Ability>[];
      json['abilities'].forEach((abilityJson) {
        abilities!.add(Ability.fromJson(abilityJson['ability']));
      });
    }
    if (json['sprites'] != null) {
      // sprite = <Sprites>[];
    }
    sprite =
        json['sprites'] != null ? new Sprites.fromJson(json['sprites']) : null;
    baseExperience = json['base_experience'];
    height = json['height'];
    if (json['types'] != null) {
      types = <String>[];
      json['types'].forEach((typeJson) {
        types!.add(typeJson['type']['name']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['height'] = this.height;
    data['base_experience'] = baseExperience;
    if (this.abilities != null) {
      data['abilities'] =
          this.abilities!.map((ability) => ability.toJson()).toList();
    }
    if (this.sprite != null) {
      data['sprites'] = this.sprite!.toJson();
    }
    if (this.types != null) {
      data['types'] = this.types!.map((type) => {'name': type}).toList();
    }
    return data;
  }
}

class Ability {
  String? name;
  String? url;

  Ability({this.name, this.url});

  Ability.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Sprites {
  String? image;
  Sprites({this.image});
  Sprites.fromJson(Map<String, dynamic> json) {
    image = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[' '] = this.image;
    return data;
  }
}
