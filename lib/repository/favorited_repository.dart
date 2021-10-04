import 'package:flutter/foundation.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/models/production_company.dart';

class FavoritedRepository with ChangeNotifier {
  final List<Movie> _movies = [];
  final List<ProductionCompany> _companies = [];

  void addMovieToFavorite(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }

  void addProductionCompanies(List<ProductionCompany> company) {
    _companies.addAll(company);
  }

  List<Movie> getAllFavoritedMovie() {
    return _movies;
  }

  List<ProductionCompany> getAllProductionCompany() {
    return _companies;
  }

  void deleteFavoritedMovie(Movie movie) {
    _movies.remove(movie);
    notifyListeners();
  }

  void deleteProductionCompany(List<ProductionCompany> companies) {
    _companies.removeWhere((company) => companies.contains(company));
    notifyListeners();
  }

  void close() {}

  Future init() async {
    return Future.value(null);
  }
}
