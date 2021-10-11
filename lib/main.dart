import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/helper/theme.dart';
import 'package:simple_movie_app/repository/favorited_repository.dart';
import 'package:simple_movie_app/repository/tab_repository.dart';
import 'package:simple_movie_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TabRepository(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoritedRepository(),
        )
      ],
      child: MaterialApp(
        theme: MovieTheme.theme(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
