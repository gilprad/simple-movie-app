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
          title: const CustomText(
            content: 'Profile',
            weight: FontWeight.bold,
            size: 24,
          ),
          centerTitle: true,
          backgroundColor: const Color(
            0xff070d2d,
          ),
        ),
        body: Container(
          color: const Color(
            0xff070d2d,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: displayHeight(context) * 0.07,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 60,
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              const CustomText(
                content: 'Email',
                size: 22,
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              const CustomText(
                content: 'Username',
                size: 20,
                weight: FontWeight.bold,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    elevation: 3,
                    shadowColor: Colors.white.withOpacity(
                      0.8,
                    )),
                onPressed: () {},
                child: const CustomText(
                  content: 'Logout',
                  size: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
