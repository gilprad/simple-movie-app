import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_movie_app/components/drawer.dart';
import 'package:simple_movie_app/screens/explore_screen.dart';
import 'package:simple_movie_app/screens/favorited_screen.dart';
import 'package:simple_movie_app/screens/watchlist_screen.dart';

class HomeScreen extends StatefulWidget with ChangeNotifier{
   HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> pages = [
    ExploreScreen(),
    FavoritedScreen(),
    WatchListScreen()
  ];

  String appBarTitle = 'Simple Movie App';
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.compass),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart),
              label: 'Favorited',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.list),
              label: 'Watch List',
            )
          ],
        ),
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(appBarTitle),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SearchScreen());
                },
                icon: const FaIcon(FontAwesomeIcons.search))
          ],
        ),
        body: IndexedStack(
          index: 0,
          children: pages,
        ),
      ),
    );
  }
}

class SearchScreen extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search Movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
