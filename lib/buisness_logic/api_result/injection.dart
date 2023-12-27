import '../cubit/character_cubit.dart';
import '../../data/repositry/character_repositry.dart';
import '../../data/web_services/cahracter_web_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<CharacterCubit>(() => CharacterCubit(getIt()));
  getIt.registerLazySingleton<CharacterRepositry>(
      () => CharacterRepositry(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

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
