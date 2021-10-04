import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_movie_app/helper/text.dart';

class EmptyFavoritedScreen extends StatelessWidget {
  const EmptyFavoritedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Spacer(),
          FaIcon(
            FontAwesomeIcons.sadTear,
            size: 100,
            color: Colors.white,
          ),
          CustomText(
            content: 'You have no favorited movie',
            size: 24,
          ),
          Spacer()
        ],
      ),
    );
  }
}
