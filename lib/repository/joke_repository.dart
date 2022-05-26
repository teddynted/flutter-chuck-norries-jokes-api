import 'package:chucknorris/data/api_provider.dart';
import 'package:chucknorris/model/joke_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<JokeModel> fetchAJoke() {
    return _provider.fetchAJoke();
  }
}

class NetworkError extends Error {}
