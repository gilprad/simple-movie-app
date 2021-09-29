import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FavoritedScreen extends StatefulWidget {
  const FavoritedScreen({Key? key}) : super(key: key);

  @override
  _FavoritedScreenState createState() => _FavoritedScreenState();
}

class _FavoritedScreenState extends State<FavoritedScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Slidable(
          actions: [
            IconSlideAction(
              onTap: () {},
              caption: 'Delete',
              color: Colors.transparent,
              foregroundColor: Colors.red,
              iconWidget: FaIcon(
                FontAwesomeIcons.trash,
                color: Colors.red,
              ),
            )
          ],
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: ListTile(
            leading: Icon(Icons.ac_unit),
            title: Text(
              'Title',
            ),
          ),
        ),
      ),
      itemCount: 2,
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
