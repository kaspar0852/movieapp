import 'package:flutter/material.dart';
import 'package:movieapp/model/movie.dart';

class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;
  const MovieDetailsThumbnail({Key? key, required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail), fit: BoxFit.cover)),
            ),
            Icon(
              Icons.play_circle_fill_outlined,
              size: 50,
              color: Colors.white,
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          height: 80,
        )
      ],
    );
  }
}

class Moviedetailsheaderwithposter extends StatelessWidget {
  final Movie movie;
  const Moviedetailsheaderwithposter({Key? key, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(
            width: 16,
          ),
          Expanded(child: MoviedetailsHeader(movie: movie)),
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;
  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(poster), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}

class MoviedetailsHeader extends StatelessWidget {
  final Movie movie;
  const MoviedetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${movie.year}. ${movie.genre}".toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.indigoAccent.shade700,
          ),
        ),
        Text(movie.title,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 40,
            )),
        Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
            children: <TextSpan>[
              TextSpan(
                text: movie.plot,
              ),
              TextSpan(
                  text: "More....",
                  style: TextStyle(
                    color: Colors.indigo,
                  ))
            ]))
      ],
    );
  }
}

class MoviedetailsCast extends StatelessWidget {
  final Movie movie;
  const MoviedetailsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: <Widget>[
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Director", value: movie.director),
          MovieField(field: "Awards", value: movie.awards),
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;
  const MovieField({Key? key, required this.field, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "$field:",
          style: TextStyle(
            color: Colors.black38,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300),
          ),
        )
      ],
    );
  }
}

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieExtraPoster extends StatelessWidget {
  final List<String> posters;
  const MovieExtraPoster({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "More Movie Posters".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 8.0,
              ),
              itemCount: posters.length,
              itemBuilder: (context, index) => ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: 160,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: NetworkImage(posters[index]),
                      fit: BoxFit.cover,
                    )),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
