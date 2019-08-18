import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile_movies_demo/model/movie_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = "1edeb9ac8156f4fd1ebd4bb7081667a1";
  final _baseUrl = "https://api.themoviedb.org/";

  Future<MovieModel> fetchMovieList(String id) async {
    final response = await client
        .get("$_baseUrl/3/movie/$id/recommendations?api_key=$_apiKey");

    if (response.statusCode == 200) {
      print(response.body.toString());
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies list');
    }
  }
}
