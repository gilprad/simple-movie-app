import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:simple_movie_app/helper/responsive.dart';

class DetailPageScreen extends StatefulWidget {
  const DetailPageScreen({Key? key}) : super(key: key);

  @override
  _DetailPageScreenState createState() => _DetailPageScreenState();
}

class _DetailPageScreenState extends State<DetailPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: displayWidth(context) * 0.4,
        height: displayHeight(context) * 0.067,
        child: FloatingActionButton(
          child: const Text(
            'Add to Favorite',
            textAlign: TextAlign.center,
          ),
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      appBar: AppBar(
        title: Text('Detail Movie'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: displayHeight(context),
          width: displayWidth(context),
          color: Colors.lightBlue,
          padding: EdgeInsets.symmetric(horizontal: 30),
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
                        color: Colors.white.withOpacity(0.3),
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.1),
                        offset: Offset(0, 9),
                        blurRadius: 3,
                        spreadRadius: 5,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/ziEuG1essDuWuC5lpWUaw1uXY2O.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Title',
                  style: TextStyle(fontSize: 28),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Chip(
                label: Text(
                  'Action',
                ),
                backgroundColor: Colors.lightBlueAccent,
                shadowColor: Colors.black.withOpacity(0.7),
                elevation: 5,
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'Status: ',
                    ),
                    Spacer(),
                    Text(
                      'Released',
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'Release Date: ',
                    ),
                    Spacer(),
                    Text(
                      '20 June 2021',
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'Rating: ',
                    ),
                    Spacer(),
                    Text('7.9/10')
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Overview',
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'a',
                textAlign: TextAlign.left,
                maxLines: 10,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
