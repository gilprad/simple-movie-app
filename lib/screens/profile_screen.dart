import 'package:flutter/material.dart';
import 'package:simple_movie_app/helper/responsive.dart';

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
          title: Text('Profile'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: displayHeight(context) * 0.07,
              ),
              Center(
                child: CircleAvatar(
                  radius: 50,
                ),
              ),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Text('Name'),
              SizedBox(
                height: displayHeight(context) * 0.05,
              ),
              Text('Username'),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(),
                onPressed: () {},
                child: Text('Logout'),
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
