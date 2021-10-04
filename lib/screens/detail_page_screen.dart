import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:simple_movie_app/api/services/movie_service.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/repository/favorited_repository.dart';

class DetailPageScreen extends StatefulWidget {
  Movie movie;
  int movieId;
  DetailPageScreen({
    Key? key,
    required this.movie,
    required this.movieId,
  }) : super(key: key);

  @override
  _DetailPageScreenState createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  MovieService service = MovieService();

  Future<Movie> getDetail(int index) async {
    try {
      return service.getDetailMovie(index);
    } on MovieResponseException catch (e) {
      throw MovieResponseException(
          message: "Gagal memuat film populer", exception: e);
    }
  }

  String pathImageUrl = 'https://image.tmdb.org/t/p/w500';
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(
        0xff070d2d,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: displayWidth(context) * 0.4,
        height: displayHeight(context) * 0.07,
        child: FloatingActionButton(
          child: CustomText(
            content: isFavorited ? 'Remove from Favorite' : 'Add to Favorite',
            weight: FontWeight.w600,
            size: 16,
            align: TextAlign.center,
          ),
          onPressed: () {
            // showDialog(
            //     context: context,
            //     builder: (context) => CustomDialog(
            //           movie: widget.movie,
            //         ));
            showAlertDialog(context, widget.movie);
          },
          backgroundColor: isFavorited
              ? Colors.red
              : const Color(
                  0xff5770e5,
                ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
      appBar: AppBar(
        backgroundColor: const Color(
          0xff070d2d,
        ),
        title: const CustomText(
          content: 'Detail Movie',
          size: 24,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Movie>(
        future: getDetail(widget.movieId),
        builder: (BuildContext context, AsyncSnapshot<Movie> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                width: displayWidth(context),
                height: displayHeight(context),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: displayHeight(context) * 0.5,
                      width: displayWidth(context) * 0.65,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(
                                0.1,
                              ),
                              offset: const Offset(
                                0,
                                10,
                              ),
                              blurRadius: 1,
                              spreadRadius: 1,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(
                              pathImageUrl + snapshot.data!.posterPath!,
                            ),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        content: snapshot.data!.title,
                        size: 24,
                        weight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Chip(
                      label: CustomText(
                        content: 'Action',
                      ),
                      backgroundColor: Color(
                        0xff161a36,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          content: 'Status:',
                          size: 18,
                          weight: FontWeight.w600,
                        ),
                        CustomText(
                          content: snapshot.data!.status,
                          size: 18,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          size: 18,
                          weight: FontWeight.w600,
                          content: 'Release Date: ',
                        ),
                        CustomText(
                          size: 18,
                          weight: FontWeight.w600,
                          content: snapshot.data!.releaseDate.toString(),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          size: 18,
                          weight: FontWeight.w600,
                          content: 'Rating: ',
                        ),
                        CustomText(
                          content:
                              snapshot.data!.voteAverage.toString() + '/10',
                          size: 18,
                          weight: FontWeight.w600,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const CustomText(
                      content: 'Overview',
                      size: 18,
                      weight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: CustomText(
                        weight: FontWeight.w600,
                        size: 18,
                        content: snapshot.data!.overview,
                        align: TextAlign.left,
                        maxlines: 10,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
            );
          }
          if (snapshot.hasError) {
            return CustomText(
              content: snapshot.error.toString(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }

  showAlertDialog(BuildContext context, Movie movie) {
    final FavoritedRepository repository =
        Provider.of<FavoritedRepository>(context, listen: false);
    Widget yesButton = TextButton(
        onPressed: () {
          setState(() {
            isFavorited = !isFavorited;
          });
          // if (isFavorited == false) {
          //   repository.addMovieToFavorite(widget.movie);
          //   repository
          //       .addProductionCompanies(widget.movie.productionCompanies!);
          // }
          // if (isFavorited == true) {
          //   repository.deleteFavoritedMovie(snapshot.data!);
          //   repository
          //       .deleteProductionCompany(snapshot.data!.productionCompanies!);
          // }
          repository.addMovieToFavorite(widget.movie);
          Navigator.pop(context);
        },
        child: const Text(
          'Yes',
        ));
    Widget noButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'No',
        ));

    AlertDialog alert = AlertDialog(
      backgroundColor: const Color(
        0xff161a36,
      ),
      elevation: 5,
      title: const CustomText(
        content: 'Alert',
      ),
      content: isFavorited
          ? const CustomText(
              content: 'You will remove this film from favorited, continue?',
              size: 20,
              maxlines: 2,
            )
          : const CustomText(
              content: 'You will favorite this film, continue?',
              size: 20,
            ),
      actions: [
        noButton,
        yesButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
