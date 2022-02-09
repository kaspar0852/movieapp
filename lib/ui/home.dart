// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:movieapp/model/movie.dart';

import 'movie_ui/movie_ui.dart';

// ignore: use_key_in_widget_constructors
class MovieList extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();
  final List movies = [
    "Ironman",
    "Batman",
    "Shang Chi",
    "Hulk",
    "Thor",
    "Black Widow"
  ];

  get imageUrl => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade600,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(top: 10, child: movieImage(movieList[index].images[0]))
            ]);

            /*             return Card(
              elevation: 8.5,
              color: Colors.white,
              // ignore: prefer_const_constructors
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      //color: Colors.blueAccent,
                      image: DecorationImage(
                        image: NetworkImage(movieList[index].images[0]),
                        fit: BoxFit.cover,
                      ),

                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: null,
                  ),
                ),
                title: Text(movieList[index].title),
                subtitle: Text("${movieList[1].title}"),
                trailing: Text("..."),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Movielistviewdetails(
                                movieName: movieList.elementAt(index).title,
                                movie: movieList[index],
                              )));
                },
                //onTap: () => debugPrint("Movie name: ${movies[index]}"),
              ),
            ); */
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 40),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 60),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(movie.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white,
                              )),
                        ),
                        Text("Raiting: ${movie.imdbRaiting}/10",
                            style: maintextstyle()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text("Released: ${movie.released}",
                            style: maintextstyle()),
                        Text(movie.runtime, style: maintextstyle()),
                        Text(movie.rated, style: maintextstyle()),
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Movielistviewdetails(movieName: movie.title, movie: movie)))
      },
    );
  }

  TextStyle maintextstyle() {
    return TextStyle(
      fontSize: 17,
      color: Colors.grey,
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??
                  'https://upload.wikimedia.org/wikipedia/commons/0/06/Question-mark.jpg'),
              fit: BoxFit.cover)),
    );
  }
}

//new route(screen or page )
class Movielistviewdetails extends StatelessWidget {
  final String movieName;

  final Movie movie;

  const Movielistviewdetails(
      {Key? key, required this.movieName, required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[1]),
          Moviedetailsheaderwithposter(movie: movie),
          HorizontalLine(),
          MoviedetailsCast(movie: movie),
          HorizontalLine(),
          MovieExtraPoster(posters: movie.images),
        ],
      ),
/*       body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: ElevatedButton(
              // ignore: unnecessary_this
              child: Text("Back ${this.movie.director}"),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ), */
    );
  }
}
