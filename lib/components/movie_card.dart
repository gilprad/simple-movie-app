import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/screens/detail_page_screen.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  void goToDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DetailPageScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goToDetailPage,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: displayHeight(context) * 0.3,
              width: displayWidth(context) * 0.45,
              decoration: BoxDecoration(
                  color: Colors.blue,
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
                  content: 'Title',
                  size: 20,
                  weight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                )),
            CustomText(
              content: 'Review',
              size: 18,
              weight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
