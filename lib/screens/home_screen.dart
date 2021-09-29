import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/components/drawer.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/repository/tab_repository.dart';
import 'package:simple_movie_app/screens/detail_page_screen.dart';
import 'package:simple_movie_app/screens/empty_favorite_screen.dart';
import 'package:simple_movie_app/screens/explore_screen.dart';
import 'package:simple_movie_app/screens/favorited_screen.dart';
import 'package:simple_movie_app/screens/companies_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ChangeNotifier {
  static List<Widget> pages = [
    ExploreScreen(),
    FavoritedScreen(),
    CompaniesScreen()
  ];

  String appBarTitle = 'Simple Movie App';

  @override
  Widget build(BuildContext context) {
    return Consumer<TabRepository>(builder: (context, tabRepository, child) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Color(
            0xff070d2d,
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white,
            backgroundColor: Color(
              0xff070d2d,
            ),
            selectedItemColor: Color(
              0xff5770e5,
            ),
            currentIndex: tabRepository.selectedTab,
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
                label: 'Companies',
              )
            ],
          ),
          drawer: CustomDrawer(),
          appBar: AppBar(
            backgroundColor: Color(
              0xff070d2d,
            ),
            title: CustomText(
              content: appBarTitle,
              weight: FontWeight.bold,
            ),
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
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: GoogleFonts.nunito(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        )));
  }

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
    return Container(
      color: Color(
        0xff070d2d,
      ),
      child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DetailPageScreen()));
                },
                leading: Icon(
                  Icons.ac_unit,
                  color: Colors.white,
                ),
                title: CustomText(
                  content: 'Title',
                  size: 18,
                  weight: FontWeight.w600,
                ),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: 2),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Color(
        0xff070d2d,
      ),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            showResults(context);
          },
          title: CustomText(
            content: 'Title',
            size: 18,
            weight: FontWeight.w600,
          ),
          leading: FaIcon(
            FontAwesomeIcons.history,
            color: Colors.white.withOpacity(
              0.8,
            ),
          ),
          trailing: IconButton(
            icon: FaIcon(
              FontAwesomeIcons.trash,
              color: Colors.white.withOpacity(
                0.8,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
