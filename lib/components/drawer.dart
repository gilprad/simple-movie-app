import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_movie_app/helper/responsive.dart';
import 'package:simple_movie_app/helper/text.dart';
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
      child: Material(
        color: Color(
          0xff070d2d,
        ),
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
            CustomText(
              content: 'Username',
              size: 20,
            ),
            SizedBox(
              height: displayHeight(context) * 0.02,
            ),
            CustomText(
              content: 'Email',
              size: 18,
            ),
            SizedBox(
              height: displayHeight(context) * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.user,
                  color: Colors.white,
                ),
                title: CustomText(
                  content: 'Profile',
                  size: 18,
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                },
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.9),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                leading: FaIcon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.red,
                ),
                title: CustomText(
                  content: 'Logout',
                  color: Colors.red,
                  size: 18,
                ),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
