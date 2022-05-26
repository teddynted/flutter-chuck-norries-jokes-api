import 'package:chucknorris/model/joke_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.chucknorris.io/jokes/random';

  Future<JokeModel> fetchAJoke() async {
    try {
      Response response = await _dio.get(_url);
      return JokeModel.fromJson(response.data);
    } catch (error) {
      print('Exception: $error');
      return JokeModel.withError(error.toString());
    }
  }
}
