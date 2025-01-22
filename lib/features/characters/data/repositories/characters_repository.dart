import 'package:flutter_series_app_bloc/features/characters/data/web_services/characters_web_services.dart';
import "package:flutter_series_app_bloc/features/characters/data/models/character_model.dart";

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<CharacterModel>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => CharacterModel.fromJson(character))
        .toList();
  }
}
