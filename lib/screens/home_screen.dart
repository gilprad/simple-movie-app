import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/components/drawer.dart';
import 'package:simple_movie_app/repository/tab_repository.dart';
import 'package:simple_movie_app/screens/detail_page_screen.dart';
import 'package:simple_movie_app/screens/explore_screen.dart';
import 'package:simple_movie_app/screens/favorited_screen.dart';
import 'package:simple_movie_app/screens/watchlist_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ChangeNotifier {
  static List<Widget> pages = [
    ExploreScreen(),
    FavoritedScreen(),
    WatchListScreen()
  ];

  String appBarTitle = 'Simple Movie App';

  @override
  Widget build(BuildContext context) {
    return Consumer<TabRepository>(builder: (context, tabRepository, child) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              tabRepository.goToTab(index);
            },
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
            index: tabRepository.selectedTab,
            children: pages,
          ),
        ),
      );
    });
  }
}

class SearchScreen extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Search Movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: FaIcon(
          FontAwesomeIcons.times,
        ),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => DetailPageScreen()));
              },
              leading: Icon(Icons.ac_unit),
              title: Text('Title'),
            ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: 2);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        title: Text(
          'Title',
        ),
        leading: FaIcon(FontAwesomeIcons.history),
        trailing: IconButton(
          icon: FaIcon(FontAwesomeIcons.trash),
          onPressed: () {},
        ),
      ),
    );
  }
}
