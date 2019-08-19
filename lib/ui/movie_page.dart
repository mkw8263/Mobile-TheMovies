import 'package:flutter/material.dart';
import 'package:mobile_movies_demo/bloc/movies_bloc.dart';
import 'package:mobile_movies_demo/model/movie_model.dart';
import 'package:mobile_movies_demo/ui/movie_detail_page.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieListPage extends StatefulWidget {
  @override
  State createState() => MovieListPageState();
}

class MovieListPageState extends State<MovieListPage> {
  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovies(330.toString());
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: StreamBuilder(
            stream: bloc.allMovies,
            builder: ((context, snapshot) {
              if (snapshot.hasData)
                return buildList(snapshot, size, context);
              else if (snapshot.hasError)
                return Text(snapshot.error.toString());
              else
                return Center(child: CircularProgressIndicator());
            })));
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot, Size size,
      BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: snapshot.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    MovieDetailPage(
                      movieResult: snapshot.data.results[index],)));
          },
          child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              fit: BoxFit.cover,
              image: 'https://image.tmdb.org/t/p/w500/'
                  '${snapshot.data.results[index].backdropPath}'),
        );
      },
    );
  }
}
