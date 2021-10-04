import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/helper/text.dart';

import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/repository/favorited_repository.dart';

class CustomDialog extends StatefulWidget {
  final Movie movie;
  const CustomDialog({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    final FavoritedRepository repository =
        Provider.of<FavoritedRepository>(context, listen: false);
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(
          10,
        ),
        height: 200,
        color: const Color(
          0xff070d2d,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              content: 'Alert',
              size: 24,
              weight: FontWeight.bold,
            ),
            const SizedBox(
              height: 15,
            ),
            const CustomText(
              content: 'You will add this film to favorite, \nproceed?',
              size: 18,
              align: TextAlign.left,
            ),
            const Spacer(),
            Row(
              children: [
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: const CustomText(
                      content: 'No',
                      size: 18,
                      weight: FontWeight.bold,
                      color: Colors.lightBlue,
                    )),
                TextButton(
                    onPressed: () {
                      repository.addMovieToFavorite(widget.movie);
                      repository.addProductionCompanies(
                          widget.movie.productionCompanies!);
                    },
                    child: const CustomText(
                      content: 'Yes',
                      size: 18,
                      weight: FontWeight.bold,
                      color: Colors.lightBlue,
                    )),
                const SizedBox(
                  width: 20,
                )
              ],
            )
          ],
        ),
        // color: Color,
      ),
    );
  }
}
