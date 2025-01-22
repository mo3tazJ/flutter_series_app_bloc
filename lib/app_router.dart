import 'package:flutter/material.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CharactersScreen());
    }
  }
}
