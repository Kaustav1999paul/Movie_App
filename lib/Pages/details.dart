import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/models/MovieModel.dart';

class DetailsPage extends StatelessWidget {
  List<Color> _colors = [Colors.red, Colors.black];
  final ArticleModel movies;

  DetailsPage(this.movies);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.black, // status bar color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0, left: 5, right: 5),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/" + movies.backdrop_path,
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 10,
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 140,
                      ),
                      Hero(
                        tag: 'poster',
                        child: Container(
                          alignment: Alignment.center,
                          height: 230,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500/" +
                                  movies.poster_path,
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 10,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        alignment: Alignment.center,
                        child: Text(
                          movies.title,
                          style: GoogleFonts.comfortaa(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Out on",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            movies.release_date,
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton(
                        onPressed: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "About",
                              style: GoogleFonts.comfortaa(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 30),
                              child: Text(
                                movies.overview,
                                style: GoogleFonts.comfortaa(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w200),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
