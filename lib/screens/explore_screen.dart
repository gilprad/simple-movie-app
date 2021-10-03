import 'package:flutter/material.dart';
import 'package:simple_movie_app/api/services/movie_service.dart';
import 'package:simple_movie_app/components/movie_card.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/movie.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  MovieService service = MovieService();

  Future<List<Movie>> getPopularData() async {
    try {
      return service.getPopular();
    } on MovieResponseException catch (e) {
      throw MovieResponseException(
          message: "Gagal memuat film populer", exception: e);
    }
  }

  Future<List<Movie>> getTopRatedData() async {
    try {
      return service.getTopRated();
    } on MovieResponseException catch (e) {
      throw MovieResponseException(message: "Gagal memuat film", exception: e);
    }
  }

  Future<List<Movie>> getUpcomingData() async {
    try {
      return service.getUpcoming();
    } on MovieResponseException catch (e) {
      throw MovieResponseException(message: "Gagal memuat film", exception: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        buildTopRatedMovies(),
        const SizedBox(
          height: 20,
        ),
        buildPopularMovies(),
        const SizedBox(
          height: 20,
        ),
        buildUpcomingMovies()
      ],
    );
  }

  Widget buildTopRatedMovies() {
    return FutureBuilder<List<Movie>>(
        future: getTopRatedData(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasError) {
            return CustomText(
              content: snapshot.error.toString(),
            );
          }

          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    content: 'Top Rated Movie',
                    weight: FontWeight.w600,
                    size: 24,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: displayHeight(context) * 0.4,
                    color: Colors.transparent,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                              movie: snapshot.data![index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 20,
                            ),
                        itemCount: snapshot.data!.length),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget buildPopularMovies() {
    return FutureBuilder<List<Movie>>(
        future: getPopularData(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasError) {
            return CustomText(
              content: snapshot.error.toString(),
            );
          }

          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    content: 'Popular Movie',
                    weight: FontWeight.w600,
                    size: 24,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: displayHeight(context) * 0.4,
                    color: Colors.transparent,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                              movie: snapshot.data![index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 20,
                            ),
                        itemCount: snapshot.data!.length),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Widget buildUpcomingMovies() {
    return FutureBuilder<List<Movie>>(
        future: getUpcomingData(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasError) {
            return CustomText(
              content: snapshot.error.toString(),
            );
          }

          if (snapshot.hasData) {
            return Container(
              padding: EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    content: 'Upcoming Movie',
                    weight: FontWeight.w600,
                    size: 24,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: displayHeight(context) * 0.4,
                    color: Colors.transparent,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MovieCard(
                              movie: snapshot.data![index],
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              width: 20,
                            ),
                        itemCount: snapshot.data!.length),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
