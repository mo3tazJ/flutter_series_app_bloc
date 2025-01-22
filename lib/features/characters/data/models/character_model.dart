class CharacterModel {
  int id;
  String name;
  String statusDeadOrAlive;
  String species;
  String speciesType;
  String gender;
  String image;
  OriginModel origin;
  LocationModel lastLocation;
  List<dynamic> episodesAppearedIn;

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
      origin: jsonData["id"],
      lastLocation: jsonData["id"],
      episodesAppearedIn: jsonData["episode"],
    );
  }
}

class OriginModel {
  String name;
  String url;
  OriginModel({
    required this.name,
    required this.url,
  });

  factory OriginModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> targetedData = jsonData["origin"];

    return OriginModel(
      name: targetedData['name'],
      url: targetedData['url'],
    );
  }
}

class LocationModel {
  String name;
  String url;
  LocationModel({
    required this.name,
    required this.url,
  });

  factory LocationModel.fromJson(Map<String, dynamic> jsonData) {
    Map<String, dynamic> targetedData = jsonData["location"];

    return LocationModel(
      name: targetedData['name'],
      url: targetedData['url'],
    );
  }
}
