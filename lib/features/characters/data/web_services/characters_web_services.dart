import "dart:developer";

import "package:dio/dio.dart";
import "package:flutter_series_app_bloc/core/constants/strings.dart";

class CharactersWebServices {
  late Dio dio;
  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get("character");
      // log(response.data.toString());
      return response.data;
    } catch (e) {
      log(e.toString());
      return {};
    }
  }
}
