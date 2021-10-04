import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/repository/favorited_repository.dart';
import 'package:simple_movie_app/screens/empty_favorite_screen.dart';

class FavoritedScreen extends StatefulWidget {
  const FavoritedScreen({Key? key}) : super(key: key);

  @override
  _FavoritedScreenState createState() => _FavoritedScreenState();
}

class _FavoritedScreenState extends State<FavoritedScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritedRepository>(
      builder: (BuildContext context, repository, child) {
        List<Movie> movies = repository.getAllFavoritedMovie();
        if (movies.isNotEmpty) {
          return ListView.separated(
            itemBuilder: (context, index) => Container(
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Slidable(
                actions: [
                  IconSlideAction(
                    onTap: () {
                      repository.deleteFavoritedMovie(movies[index]);
                    },
                    caption: 'Delete',
                    color: Colors.transparent,
                    foregroundColor: Colors.red,
                    iconWidget: const FaIcon(
                      FontAwesomeIcons.trash,
                      color: Colors.red,
                    ),
                  )
                ],
                actionPane: const SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ListTile(
                  leading: const Icon(
                    Icons.ac_unit,
                  ),
                  title: CustomText(
                    content: movies[index].title,
                  ),
                ),
              ),
            ),
            itemCount: movies.length,
            separatorBuilder: (context, index) => const Divider(),
          );
        } else {
          return const EmptyFavoritedScreen();
        }
      },
    );
  }
}
