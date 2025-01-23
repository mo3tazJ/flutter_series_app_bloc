import 'package:flutter/material.dart';
import 'package:flutter_series_app_bloc/core/constants/color_manager.dart';
import 'package:flutter_series_app_bloc/features/characters/data/models/character_model.dart';

class CharacterItem extends StatelessWidget {
  final CharacterModel character;
  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
        color: AppColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            character.name,
            style: const TextStyle(
              height: 1.3,
              fontSize: 16,
              color: AppColors.myWhite,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: AppColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/loading.gif",
                  image: character.image,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/NoImage.png"),
        ),
      ),
    );
  }
}
