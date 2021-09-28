import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/repository/favorited_repository.dart';
import 'package:simple_movie_app/repository/tab_repository.dart';
import 'package:simple_movie_app/screens/detail_page_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TabRepository(),
        ),
        // ChangeNotifierProvider(
        //   create: (_) => FavoritedRepository(),
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
