class CharacterModel {
  final int id;
  final String name;
  final String statusDeadOrAlive;
  final String species;
  final String speciesType;
  final String gender;
  final String image;
  final LocationModel? origin;
  final LocationModel? lastLocation;
  final List<dynamic> episodesAppearedIn;

  CharacterModel({
    required this.id,
    required this.name,
    required this.statusDeadOrAlive,
    required this.species,
    required this.speciesType,
    required this.gender,
    required this.image,
    required this.origin,
    required this.lastLocation,
    required this.episodesAppearedIn,
  });
  factory CharacterModel.fromJson(Map<String, dynamic> jsonData) {
    return CharacterModel(
      id: jsonData["id"],
      name: jsonData["name"],
      statusDeadOrAlive: jsonData["status"],
      species: jsonData["species"],
      speciesType: jsonData["type"],
      gender: jsonData["gender"],
      image: jsonData["image"],
      origin: jsonData["origin"] == null
          ? null
          : LocationModel.fromJson(jsonData["origin"]),
      lastLocation: jsonData["location"] == null
          ? null
          : LocationModel.fromJson(jsonData["location"]),
      episodesAppearedIn: jsonData["episode"] == null
          ? []
          : List<String>.from(jsonData["episode"]!.map((x) => x)),
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": statusDeadOrAlive,
        "species": species,
        "type": speciesType,
        "gender": gender,
        "origin": origin?.toJson(),
        "location": lastLocation?.toJson(),
        "image": image,
        "episode": episodesAppearedIn.map((x) => x).toList(),
      };
}

class LocationModel {
  final String name;
  final String url;
  LocationModel({
    required this.name,
    required this.url,
  });

  factory LocationModel.fromJson(Map<String, dynamic> jsonData) {
    return LocationModel(
      name: jsonData['name'],
      url: jsonData['url'],
    );
  }
  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
