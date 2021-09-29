import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              content: 'Title',
              size: 20,
              weight: FontWeight.bold,
            )),
        CustomText(
          content: 'Review',
          size: 18,
          weight: FontWeight.w600,
        ),
      ],
    );
  }
}
