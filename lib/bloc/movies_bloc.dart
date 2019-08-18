import 'package:mobile_movies_demo/model/movie_model.dart';
import 'package:mobile_movies_demo/resources/repository_manager.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieModel>();

  Observable<MovieModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies(String id) async {
    MovieModel itemModel = await _repository.fetchMovies(id);
    _moviesFetcher.sink.add(itemModel);
    print(itemModel.toString());
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();
