import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/Pages/details.dart';
import 'package:movie_app/helper/Movies.dart';
import 'package:movie_app/models/MovieModel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ArticleModel> popularMovies = new List<ArticleModel>();
  List<ArticleModel> upcomingMovies = new List<ArticleModel>();
  List<ArticleModel> topRatedMovies = new List<ArticleModel>();

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getPopularMovies();
    getUpcomingMovies();
    getTopRatedMovies();
  }

  getPopularMovies() async {
    PopularMovies popMovies = new PopularMovies(number: 1);
    await popMovies.getMovies();
    popularMovies = popMovies.movie;
    setState(() {
      _isLoading = false;
    });
  }

  getUpcomingMovies() async {
    UpcomingMovies upMovies = new UpcomingMovies();
    await upMovies.getMovies();
    upcomingMovies = upMovies.movie;
    setState(() {
      _isLoading = false;
    });
  }

  getTopRatedMovies() async {
    TopRatedMovies topMovies = new TopRatedMovies();
    await topMovies.getMovies();
    topRatedMovies = topMovies.movie;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.black, // status bar color
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _isLoading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      child: Image.network(
                          "https://i1.wp.com/freepngimages.com/wp-content/uploads/2016/10/netflix-logo.png?fit=939%2C587"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                          height: 300.0,
                          width: 350.0,
                          child: Carousel(
                            images: [
                              NetworkImage(
                                  'https://images.unsplash.com/photo-1512113569142-8a60fccc7caa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'),
                              NetworkImage(
                                  'https://images.unsplash.com/photo-1461151304267-38535e780c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2000&q=80'),
                              NetworkImage(
                                  'https://images.unsplash.com/photo-1588546506381-74592e9b8a2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80'),
                              NetworkImage(
                                  'https://images.unsplash.com/photo-1586899028174-e7098604235b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80'),
                            ],
                            showIndicator: false,
                            borderRadius: true,
                            moveIndicatorFromBottom: 180.0,
                            noRadiusForIndicator: false,
                            overlayShadow: false,
                            overlayShadowColors: Colors.white,
                            overlayShadowSize: 0.8,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50, bottom: 10),
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Popular Movies",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: popularMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(popularMovies[index]),
                                  ),
                                );
                              },
                              child: Item(
                                imageUrl: "https://image.tmdb.org/t/p/w500/" +
                                    popularMovies[index].poster_path,
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Upcoming Movies",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 0),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: upcomingMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(upcomingMovies[index]),
                                  ),
                                );
                              },
                              child: Item(
                                imageUrl: "https://image.tmdb.org/t/p/w500/" +
                                    upcomingMovies[index].poster_path,
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      padding: EdgeInsets.only(left: 20, right: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Top Rated Movies",
                            style: GoogleFonts.comfortaa(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(bottom: 30),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: topRatedMovies.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(topRatedMovies[index]),
                                  ),
                                );
                              },
                              child: Item(
                                imageUrl: "https://image.tmdb.org/t/p/w500/" +
                                    topRatedMovies[index].poster_path,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String imageUrl;

  const Item({this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
    );
  }
}
