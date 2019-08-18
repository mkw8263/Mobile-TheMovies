import 'package:flutter/material.dart';
import 'package:mobile_movies_demo/bloc/movies_bloc.dart';
import 'package:mobile_movies_demo/model/movie_model.dart';

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
      body: Stack(
        children: <Widget>[
          StreamBuilder(
              stream: bloc.allMovies,
              builder: ((context, snapshot) {
                if (snapshot.hasData)
                  return buildList(snapshot);
                else if (snapshot.hasError)
                  return Text(snapshot.error.toString());
                else
                  return Center(child: CircularProgressIndicator());
              }))
        ],
      ),
    );
  }

  Widget buildList(AsyncSnapshot<MovieModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          child: InkResponse(
            splashColor: Colors.red,
            enableFeedback: true,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${snapshot.data.results[index].backdropPath}',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
