import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';

class ProfileScreen extends StatefulWidget with ChangeNotifier {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            content: 'Profile',
            weight: FontWeight.bold,
            size: 24,
          ),
          centerTitle: true,
          backgroundColor: Color(
            0xff070d2d,
          ),
        ),
        body: Container(
          color: Color(
            0xff070d2d,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: displayHeight(context) * 0.07,
              ),
              Center(
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              CustomText(
                content: 'Email',
                size: 22,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              CustomText(
                content: 'Username',
                size: 20,
                weight: FontWeight.bold,
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    elevation: 3,
                    shadowColor: Colors.white.withOpacity(
                      0.8,
                    )),
                onPressed: () {},
                child: CustomText(
                  content: 'Logout',
                  size: 18,
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
