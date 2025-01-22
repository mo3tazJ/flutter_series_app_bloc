import 'package:flutter/material.dart';
import 'package:flutter_series_app_bloc/core/constants/strings.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/screens/character_details.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen: // --> '/'
        return MaterialPageRoute(builder: (_) => CharactersScreen());
      case characterDetailsScreen: // --> '/'
        return MaterialPageRoute(builder: (_) => CharacterDetails());
    }
  }
}
