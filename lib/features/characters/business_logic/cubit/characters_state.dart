part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<CharacterModel> characters;

  const CharactersLoaded({required this.characters});
}
