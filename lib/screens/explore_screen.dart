import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
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
        ),
      ),
    );
  }

  Widget buildTopRatedMovies() {
    return Center(
        child: Text(
      'Top Rated',
    ));
  }

  Widget buildPopularMovies() {
    return Center(
      child: Text(
        'Popular',
      ),
    );
  }

  Widget buildUpcomingMovies() {
    return Center(
      child: Text(
        'Upcoming',
      ),
    );
  }
}
