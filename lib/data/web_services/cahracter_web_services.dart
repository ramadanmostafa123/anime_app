// import 'package:breaking_bad_by_bloc/constant/strings.dart';
// import 'package:dio/dio.dart';

// class CharacterWebServices {
//   late Dio dio;
//   CharacterWebServices() {
//     BaseOptions options = BaseOptions(
//       baseUrl: baseurl,
//       receiveDataWhenStatusError: true,
//       // connectTimeout: 20 * 1000 as Duration,
//       // receiveTimeout: 20 * 1000 as Duration,
//     );
//     dio = Dio(options);
//   }
//   Future<dynamic> getAllCharacters() async {
//     try {
//       Response responce = await dio.get('character');

//       print('دى الداتا ف ليست ان شاء الله${responce.data}');

//       return responce.data;
//     } catch (e) {
//       print(e.toString());
//       return [];
//     }
//   }
// }
import 'package:breaking_bad_by_bloc/constant/strings.dart';
import 'package:breaking_bad_by_bloc/data/models/character_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cahracter_web_services.g.dart';

@RestApi(baseUrl: baseurl)
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  //users is end point
  @GET('character')
  Future<Character> getAllCharacters();
  @GET('character/{id}')
  Future<Results> getCharacterDetails(@Path('id') String userId);
  @GET('character')
  Future<Character> getAllBySearch();
}
