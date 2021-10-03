import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/screens/detail_page_screen.dart';

class MovieCard extends StatefulWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  void goToDetailPage() {
    // Navigator.of(context).push(MaterialPageRoute(
    //   builder: (context) => DetailPageScreen(movie: movie),
    // ));
  }

  static String pathImageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToDetailPage,
      child: Container(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: displayHeight(context) * 0.3,
              width: displayWidth(context) * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        pathImageUrl + widget.movie.posterPath!,
                      )),
                  borderRadius: BorderRadius.circular(
                    30,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  content: widget.movie.title,
                  size: 20,
                  weight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                )),
            CustomText(
              content: ('${widget.movie.voteAverage}/10'),
              size: 18,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
