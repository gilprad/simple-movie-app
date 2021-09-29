import 'package:flutter/material.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => ListTile(
        title: Text(
          'Title',
        ),
      ),
    );
  }
}
