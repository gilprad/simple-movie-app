import 'package:flutter/material.dart';
import 'package:simple_movie_app/components/movie_card.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        buildTrendingMovies(),
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

  Widget buildTrendingMovies() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            content: 'Trending Movie',
            weight: FontWeight.w600,
            size: 24,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: displayHeight(context) * 0.4,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieCard(),
                separatorBuilder: (context, index) => SizedBox(
                      width: 60,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }

  Widget buildPopularMovies() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            content: 'Popular Movie',
            weight: FontWeight.w600,
            size: 24,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: displayHeight(context) * 0.4,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieCard(),
                separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }

  Widget buildUpcomingMovies() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            content: 'Upcoming Movie',
            weight: FontWeight.w600,
            size: 24,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: displayHeight(context) * 0.4,
            color: Colors.transparent,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => MovieCard(),
                separatorBuilder: (context, index) => SizedBox(
                      width: 8,
                    ),
                itemCount: 5),
          )
        ],
      ),
    );
  }
}
