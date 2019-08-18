import 'package:mobile_movies_demo/model/movie_model.dart';

import 'movies_remote_provider.dart';

class Repository {
  final MovieApiProvider _movieApiProvider = MovieApiProvider();

  Future<MovieModel> fetchMovies(String id) =>
      _movieApiProvider.fetchMovieList(id);
}
