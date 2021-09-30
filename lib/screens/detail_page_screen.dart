import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';

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
      backgroundColor: Color(
        0xff070d2d,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: displayWidth(context) * 0.4,
        height: displayHeight(context) * 0.07,
        child: FloatingActionButton(
          child: CustomText(
            content: 'Add to Favorite',
            weight: FontWeight.w600,
            size: 16,
          ),
          onPressed: () {},
          backgroundColor: Color(
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
                          0.2,
                        ),
                        offset: Offset(
                          0,
                          10,
                        ),
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(
                          0.1,
                        ),
                        offset: Offset(
                          0,
                          15,
                        ),
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
                child: CustomText(
                  content: 'Title',
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
                    content: 'Released',
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
                    content: '20 June 2021',
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
                    content: '7.9/10',
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
              CustomText(
                weight: FontWeight.w600,
                size: 18,
                content: 'a',
                align: TextAlign.left,
                maxlines: 10,
              )
            ],
          ),
        ),
      ),
    ));
  }
}
