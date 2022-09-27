import 'package:bloc_tutorial/constants/my_colors.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({required this.character, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(
        8,
        8,
        8,
        8,
      ),
      padding: EdgeInsetsDirectional.all(
        4,
      ),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(
          8,
        ),
      ),
      child: GridTile(
        child: Container(
          color: MyColors.myGrey,
          child: character.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: character.image,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/placeholders.png',
                ),
        ),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text('${character.name}',style: TextStyle(),),
        ),
      ),
    );
  }
}
