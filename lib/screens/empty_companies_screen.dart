import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmptyCompaniesScreen extends StatelessWidget {
  const EmptyCompaniesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          FaIcon(
            FontAwesomeIcons.sadTear,
            size: 100,
          ),
          Text(
            'You have no favorited any movie',
            style: TextStyle(fontSize: 24),
          ),
          Spacer()
        ],
      ),
    );
  }
}
