// import 'dart:convert';

// import 'package:breaking_bad_by_bloc/data/models/character_model.dart';
// import 'package:breaking_bad_by_bloc/data/web_services/cahracter_web_services.dart';

// class CharacterRepositry {
//   final CharacterWebServices characterWebServices;

//   CharacterRepositry(this.characterWebServices);
//   Future<List<Character>> getAllCharacters() async {
//     // final List<Character> characters =
//     //     await characterWebServices.getAllCharacters();
//       var characters = await characterWebServices.getAllCharacters();

//      print(" characters======== $characters");

//     // final List<Character> characters = charactersData
//     //     .map((character) => Character.fromjson(character))
//     //     .toList();
//   ////  var response = await characterWebServices.getAllCharacters();
//    //// final Map<String, dynamic> responseData = json.decode(response);
//    //// print('respoce $response');
//    //// List<Character> characters = (responseData["results"] as List)
//       ////  .map((characterJson) =>Character.fromJson(characterJson))
//      ////   .toList();
//     return characters
//     .map((character) => Character.fromJson(character))
//     .toList();
//   }
// }


import 'package:breaking_bad_by_bloc/buisness_logic/api_result/api_result.dart';
import 'package:breaking_bad_by_bloc/buisness_logic/api_result/network_exceptions.dart';
import 'package:breaking_bad_by_bloc/data/models/character_model.dart';
import 'package:breaking_bad_by_bloc/data/web_services/cahracter_web_services.dart';

class CharacterRepositry {
  final WebServices webServices;

  CharacterRepositry(this.webServices);

  Future<ApiResult<Character>> getAllCharacters() async {
    try {
      var responce = await webServices.getAllCharacters();
      print('responce==========$responce');
      return ApiResult.success(responce);
    } catch (error) {
      // print('rrrrr');
      return ApiResult.failure(
        NetworkExceptions.getDioException(error),
      );
    }
  }

  Future<ApiResult<Results>> getCharacterDetails(String userId) async {
    try {
      var response = await webServices.getCharacterDetails(userId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  ///////////////
  Future<ApiResult<Character>> getCharactersBySearch() async {
    try {
      var searchedCharacterList;
      var responce = await webServices.getAllBySearch();
      print(responce);
      for (var element in responce.results!) {
        searchedCharacterList.add(
          element.name!.toLowerCase().startsWith('s'),
        );
                      print('$searchedCharacterList');

      }

      return ApiResult.success(responce);
      
    } catch (error) {
      return ApiResult.failure(
        NetworkExceptions.getDioException(error),
      );
    }
  }
}
