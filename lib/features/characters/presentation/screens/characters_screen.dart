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
  late List<CharacterModel> searchedCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: AppColors.myGrey,
      decoration: const InputDecoration(
          hintText: 'Find A Character...',
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: AppColors.myGrey,
            fontSize: 18,
          )),
      style: const TextStyle(
        color: AppColors.myGrey,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addFoundedItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addFoundedItemsToSearchedList(String searchedCharacter) {
    searchedCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: AppColors.myGrey,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(
              Icons.search,
              color: AppColors.myGrey,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
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
      itemCount: _searchTextController.text.isEmpty
          ? allCharacters.length
          : searchedCharacters.length,
      itemBuilder: (context, index) {
        return CharacterItem(
          character: _searchTextController.text.isEmpty
              ? allCharacters[index]
              : searchedCharacters[index],
        );
      },
    );
  }

  Widget _buildAppBarTitle() {
    return const Text(
      "Characters",
      style: TextStyle(
        color: AppColors.myGrey,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.myYellow,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
        leading: _isSearching
            ? const BackButton(
                color: AppColors.myGrey,
              )
            : Container(),
        // centerTitle: true,
      ),
      body: buildBlockWidget(),
    );
  }
}
