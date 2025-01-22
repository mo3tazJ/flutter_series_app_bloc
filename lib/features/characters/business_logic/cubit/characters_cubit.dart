import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_series_app_bloc/features/characters/data/models/character_model.dart';
import 'package:flutter_series_app_bloc/features/characters/data/repositories/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  late List<CharacterModel> characters;
  CharactersCubit(
    this.charactersRepository,
  ) : super(CharactersInitial());

  List<CharacterModel> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
