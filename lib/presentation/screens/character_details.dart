import 'job_details.dart';

import '../../constant/mycolors/mycolors.dart';
import '../../data/models/character_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character ;

  const CharacterDetailsScreen({super.key, required this.character});
  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: false,
      stretch: true,
      backgroundColor: MyColors.myWhite,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,
        title: Text(
          character.name.toString(),
          style: const TextStyle(color: MyColors.myGrey),
        ),
        background: Hero(
          tag: character.id!,
          child: Image.network(
            character.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return Text.rich(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 1,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(slivers: [
        buildSliverAppBar(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: ()=> Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobDetails(results:character ),)),
                      child: characterInfo('Job : ', character.origin!.name!),
                    ),
                    buildDivider(310),
                    characterInfo(
                        'Appeared in eposide : ', character.episode!.join('-')),
                    buildDivider(170),
                    characterInfo(
                      'species : ',
                      character.species!,
                    ),
                    buildDivider(280),
                    characterInfo('gender : ', character.gender!),
                    buildDivider(280),
                    characterInfo('status : ', character.status!),
                    buildDivider(290),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 600,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
