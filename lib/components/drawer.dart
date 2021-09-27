import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/screens/profile_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: Column(
          children: [
            SizedBox(
              height: displayHeight(context) * 0.04,
            ),
            CircleAvatar(
              radius: 35,
            ),
            SizedBox(
              height: displayHeight(context) * 0.03,
            ),
            Text('Username'),
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            Text('Email'),
            SizedBox(
              height: displayHeight(context) * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.user),
                title: Text('Profile'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.signOutAlt),
                title: Text('Logout'),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
