import 'package:dio/dio.dart';

import '../api_result/network_exceptions.dart';
import 'result_state.dart';
import '../../data/models/character_model.dart';
import '../../data/repositry/character_repositry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCubit extends Cubit<ResultState<Character>> {
  final CharacterRepositry characterRepositry;

  CharacterCubit(this.characterRepositry) : super(const Idle());

   Dio createAndSetupDio() {
    Dio dio = Dio();

    // dio
    //   ..options.connectTimeout = 200 * 1000
    //   ..options.receiveTimeout = 200 * 1000;

    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      error: true,
      requestHeader: false,
      responseHeader: false,
      request: true,
      requestBody: true,
    ));

    return dio;
  }
  void emitGetAllCharacters() async {
    var data = await characterRepositry.getAllCharacters();
    data.when(success: (Character allCharacter) {
      emit(ResultState.success(allCharacter));
      print(  allCharacter);
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void emitGetUserDetailsById(String userId) async {
    var data = await characterRepositry.getCharacterDetails(userId);
    data.when(success: (Results results) {
      ////  emit(ResultState.success(results));
      print(results);
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void emitGetAllCharactersBySearch() async {
    var data = await characterRepositry.getCharactersBySearch();
   

    data.when(success: (Character allCharacter) {
      emit(ResultState.success(allCharacter));
   
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
