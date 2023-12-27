import '../../constant/mycolors/mycolors.dart';
import '../../data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Results allCharacter;

  const CharacterItem({super.key, required this.allCharacter});
 
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: Container(
          color: MyColors.myGrey,
          child: allCharacter.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: 'assets/images/loading.gif',
                  image: allCharacter.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/images/123.jpg'),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: MyColors.myWhite,
          alignment: Alignment.bottomCenter,
          child: Text(
            allCharacter.name.toString(),
            style: const TextStyle(
              color: MyColors.myGrey,
              height: 1.2,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
        ),
      ),
    );
  }
}
