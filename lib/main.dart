import 'package:flutter/material.dart';
import 'package:mobile_movies_demo/ui/movie_page.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  build(BuildContext context) => materialApp();

  materialApp() {
    return MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: MovieListPage());
  }
}
