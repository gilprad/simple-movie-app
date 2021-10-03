import 'package:flutter/material.dart';

import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/movie.dart';

class DetailPageScreen extends StatefulWidget {
  Movie movie;
  DetailPageScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  _DetailPageScreenState createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  String pathImageUrl = 'https://image.tmdb.org/t/p/w500';
  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(
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
            showAlertDialog(context);
          },
          backgroundColor: isFavorited
              ? Colors.red
              : Color(
                  0xff5770e5,
                ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(
          0xff070d2d,
        ),
        title: CustomText(
          content: 'Detail Movie',
          size: 24,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          height: displayHeight(context),
          width: displayWidth(context),
          child: Column(
            children: [
              SizedBox(
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
                        offset: Offset(
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
                        pathImageUrl + widget.movie.posterPath!,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  content: widget.movie.title,
                  size: 24,
                  weight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Chip(
                label: CustomText(
                  content: 'Action',
                ),
                backgroundColor: Color(
                  0xff161a36,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    content: 'Status:',
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    content: widget.movie.releaseDate != null
                        ? 'Released'
                        : 'Not yet',
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    size: 18,
                    weight: FontWeight.w600,
                    content: 'Release Date: ',
                  ),
                  CustomText(
                    size: 18,
                    weight: FontWeight.w600,
                    content: widget.movie.releaseDate.toString(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    size: 18,
                    weight: FontWeight.w600,
                    content: 'Rating: ',
                  ),
                  CustomText(
                    content: widget.movie.voteAverage.toString() + '/10',
                    size: 18,
                    weight: FontWeight.w600,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CustomText(
                content: 'Overview',
                size: 18,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: CustomText(
                  weight: FontWeight.w600,
                  size: 18,
                  content: widget.movie.overview ?? '-',
                  align: TextAlign.left,
                  maxlines: 10,
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    ));
  }

  showAlertDialog(BuildContext context) {
    Widget yesButton = TextButton(
        onPressed: () {
          setState(() {
            isFavorited = !isFavorited;
          });
          Navigator.pop(context);
        },
        child: Text(
          'Yes',
        ));
    Widget noButton = TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'No',
        ));

    AlertDialog alert = AlertDialog(
      title: Text(
        'Alert',
      ),
      content: isFavorited
          ? Text(
              'You will remove this film from favorited, continue?',
              maxLines: 2,
            )
          : Text(
              'You will favorite this film, continue?',
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
