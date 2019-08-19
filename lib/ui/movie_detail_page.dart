import 'package:flutter/material.dart';
import 'package:mobile_movies_demo/model/movie_model.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieResult movieResult;

  MovieDetailPage({Key key, @required this.movieResult}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MovieDetailPage();
}

class _MovieDetailPage extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        ClipPath(
            clipper: Clipper(),
            child: Container(
                height: 370.0,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0)
                ]),
                child: widgetTopImageUI(widget))),
        widgetPlayUI()
      ],
    ));
  }
}

Widget widgetTopImageUI(MovieDetailPage widget) {
  return Stack(
    children: <Widget>[
      FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
          image: 'https://image.tmdb.org/t/p/w500/'
              '${widget.movieResult.posterPath}'),
      Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x00000000), Color(0xD9333333)],
                  stops: [0.0, 0.9],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0))),
          child: Padding(
            padding: EdgeInsets.only(top: 120.0, left: 95.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.movieResult.releaseDate,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: "SF-Pro-Display-Bold"),
                ),
                Text(
                  widget.movieResult.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontFamily: "SF-Pro-Display-Bold"),
                )
              ],
            ),
          ))
    ],
  );
}

Widget widgetPlayUI() {
  return Positioned(
      top: 345.0,
      right: -20.0,
      child: Column(
        children: <Widget>[
          FractionalTranslation(
              translation: Offset(0.0, -0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: RaisedButton(
                  color: Color(0xFFE52020),
                  onPressed: () {},
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Play",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontFamily: "SF-Pro-Display-Bold"),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ));
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 100.0);

    var controlPoint = Offset(35.0, size.height);
    var endpoint = Offset(size.width / 2, size.height);

    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endpoint.dx, endpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
