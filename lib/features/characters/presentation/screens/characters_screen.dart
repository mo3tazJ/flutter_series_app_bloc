import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_series_app_bloc/core/constants/color_manager.dart';
import 'package:flutter_series_app_bloc/features/characters/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_series_app_bloc/features/characters/data/models/character_model.dart';
import 'package:flutter_series_app_bloc/features/characters/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<CharacterModel> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlockWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.myGrey,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 2, right: 2),
          child: Column(
            children: [
              buidCharactersList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buidCharactersList() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: allCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(
            color: AppColors.myGrey,
          ),
        ),
        centerTitle: true,
      ),
      body: buildBlockWidget(),
    );
  }
}
