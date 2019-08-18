class MovieModel {
  int page;
  int totalResult;
  int totalPage;
  List<MovieResult> results = [];

  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResult = json['total_results'];
    totalPage = json['total_pages'];
    for (int i = 0; i < json['results'].length; i++) {
      results.add(MovieResult(json['results'][i]));
    }
  }
}

class MovieResult {
  bool adult;
  String backdropPath;
  List<int> genreIds = [];
  int id;
  String originLang;
  String originTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  bool isVideo;
  double voteAverage;
  int voteCount;
  double popularity;

  MovieResult(json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    for (int i = 0; i < json['genre_ids'].length; i++) {
      genreIds.add(json['genre_ids'][i]);
    }
    id = json['id'];
    originLang = json['original_language'];
    originTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    isVideo = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    popularity = json['popularity'];
  }
}
