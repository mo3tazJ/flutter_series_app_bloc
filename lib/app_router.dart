import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_series_app_bloc/core/constants/strings.dart';
import 'package:flutter_series_app_bloc/features/characters/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_series_app_bloc/features/characters/data/repositories/characters_repository.dart';
import 'package:flutter_series_app_bloc/features/characters/data/web_services/characters_web_services.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/screens/character_details.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/screens/characters_screen.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/screens/error_screen.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen: // --> '/'
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen: // --> '/'
        return MaterialPageRoute(builder: (_) => const CharacterDetails());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}
