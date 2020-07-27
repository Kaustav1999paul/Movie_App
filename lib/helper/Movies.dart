import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movie_app/models/MovieModel.dart';
import 'package:http/http.dart' as http;

class PopularMovies {
  List<ArticleModel> movie = [];
  int number;

  PopularMovies({@required this.number});

  Future<void> getMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/popular?api_key=8f6ec8303e0401c41a6659a5b5049fe5&language=en-US&page=" +
            (number.toString());

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['page'] != "0") {
      jsonData["results"].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          overview: element['overview'],
          poster_path: element['poster_path'],
          release_date: element['release_date'],
          backdrop_path: element['backdrop_path'],
          id: element['id'],
          page: element['page'],
        );
        movie.add(articleModel);
      });
    }
  }
}

class UpcomingMovies {
  List<ArticleModel> movie = [];

  Future<void> getMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/upcoming?api_key=8f6ec8303e0401c41a6659a5b5049fe5&language=en-US";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['page'] != "0") {
      jsonData["results"].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          overview: element['overview'],
          poster_path: element['poster_path'],
          release_date: element['release_date'],
          backdrop_path: element['backdrop_path'],
          id: element['id'],
          page: element['page'],
        );
        movie.add(articleModel);
      });
    }
  }
}

class TopRatedMovies {
  List<ArticleModel> movie = [];

  Future<void> getMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=8f6ec8303e0401c41a6659a5b5049fe5&language=en-US";

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['page'] != "0") {
      jsonData["results"].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          overview: element['overview'],
          poster_path: element['poster_path'],
          release_date: element['release_date'],
          backdrop_path: element['backdrop_path'],
          id: element['id'],
          page: element['page'],
        );
        movie.add(articleModel);
      });
    }
  }
}
