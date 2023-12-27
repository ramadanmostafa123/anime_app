import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'buisness_logic/cubit/character_cubit.dart';
import 'constant/strings.dart';
import 'data/models/character_model.dart';
import 'data/repositry/character_repositry.dart';
import 'data/web_services/cahracter_web_services.dart';
import 'presentation/screens/character_details.dart';
import 'presentation/screens/characters.dart';

class AppRouter {
  late CharacterRepositry characterRepositry;
  late CharacterCubit characterCubit;
   late WebServices webServices;
   late Dio dio;
  AppRouter() {
    dio = Dio();
    webServices = WebServices(dio, baseUrl: baseurl);
    characterRepositry = CharacterRepositry(webServices);
    characterCubit = CharacterCubit(characterRepositry);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => characterCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDeatails:
       final character = settings.arguments as Results;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharacterCubit(characterRepositry),
            child:  CharacterDetailsScreen(character: character,),
          ),
        );
    }
  }
}
