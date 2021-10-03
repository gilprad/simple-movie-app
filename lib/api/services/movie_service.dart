import 'package:flutter/rendering.dart';
import 'package:simple_movie_app/api/dio.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'dart:convert';

class MovieService {
  AppHttpClient client = AppHttp.client;

  Future<Movie> getDetail(int movieId) async {
    final response = await client.get('movie/$movieId');

    return Movie.fromJson(response.data);
  }

  Future<List<Movie>> getTopRated() async {
    final response = await client.get('movie/top_rated');

    var results = <Movie>[];
    // response.data['results'].forEach((a) => results.add(Movie.fromMap(a)));
    response.data['results'].forEach((data) {
      Movie movie = Movie.fromMap(data);
      results.add(movie);
    });
    return results;
  }

  Future<List<Movie>> getPopular() async {
    final response = await client.get('movie/popular');

    var results = <Movie>[];
    // response.data['results'].forEach((a) => results.add(Movie.fromMap(a)));
    response.data['results'].forEach((data) {
      Movie movie = Movie.fromMap(data);
      results.add(movie);
    });
    return results;
  }

  Future<List<Movie>> getUpcoming() async {
    final response = await client.get('movie/upcoming');

    var results = <Movie>[];
    // response.data['results'].forEach((a) => results.add(Movie.fromMap(a)));
    response.data['results'].forEach((data) {
      Movie movie = Movie.fromMap(data);
      results.add(movie);
    });
    return results;
  }

  Future<List<Movie>> searchMovie(String query) async {
    final response = await client.get('search/movie?query=$query');

    var results = <Movie>[];
    // response.data['results'].forEach((a) => results.add(Movie.fromMap(a)));
    response.data['results'].forEach((data) {
      Movie movie = Movie.fromMap(data);
      results.add(movie);
    });
    return results;
  }
}

class MovieResponseException extends AppNetworkResponseException {
  final String message;
  MovieResponseException({
    required this.message,
    required Exception exception,
  }) : super(exception: exception);
}
