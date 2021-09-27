import 'package:flutter/material.dart';

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
          appBar: AppBar(
            title: Text('Detail Movie'),
            centerTitle: true,
          ),
          body: Container()),
    );
  }
}
