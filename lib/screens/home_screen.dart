import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:simple_movie_app/api/dio_base.dart';
import 'package:simple_movie_app/api/dio_exception.dart';
import 'package:simple_movie_app/api/services/movie_service.dart';
import 'package:simple_movie_app/components/drawer.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/movie.dart';
import 'package:simple_movie_app/repository/tab_repository.dart';
import 'package:simple_movie_app/screens/companies_screen.dart';
import 'package:simple_movie_app/screens/detail_page_screen.dart';
import 'package:simple_movie_app/screens/empty_favorite_screen.dart';
import 'package:simple_movie_app/screens/explore_screen.dart';
import 'package:simple_movie_app/screens/favorited_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ChangeNotifier {
  Future<SharedPreferences> pref = SharedPreferences.getInstance();
  MovieService movieService = MovieService();

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
            unselectedItemColor: Colors.grey,
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
                  onPressed: () async {
                    pref.then((pref) {
                      final searchData = pref.getStringList('search') ?? [];
                      showSearch(
                        context: context,
                        delegate: SearchScreen(
                          searchData: searchData,
                          pref: pref,
                          movieService: movieService,
                        ),
                      );
                    });
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.search,
                  ))
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

class SearchScreen extends SearchDelegate<String> {
  MovieService movieService;
  List<String>? searchData;
  SharedPreferences? pref;

  SearchScreen({
    required this.movieService,
    this.searchData,
    this.pref,
  });

  void addSearch() {
    if (query.isNotEmpty) {
      searchData!.insert(0, query);
      pref!.setStringList('search', searchData!);
    }
  }

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
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    addSearch();
    return FutureBuilder(
      future: movieService.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        String pathImageUrl = 'https://image.tmdb.org/t/p/w500';
        if (snapshot.hasData) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              color: Color(
                0xff070d2d,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPageScreen(
                                    movie: snapshot.data![index],
                                  )));
                        },
                        child: Card(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                            10,
                          )),
                          elevation: 3,
                          child: Container(
                            height: 150,
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 30,
                                  ),
                                  height: 140,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            pathImageUrl +
                                                snapshot
                                                    .data![index].posterPath!,
                                          ))),
                                ),
                                Container(
                                  width: 230,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        content: snapshot.data![index].title,
                                        size: 20,
                                        weight: FontWeight.w600,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        content: snapshot
                                                .data![index].voteAverage
                                                .toString() +
                                            '/10',
                                        size: 18,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount: snapshot.data!.length),
            );
          }
          if (snapshot.data == null) {
            return Center(
              child: CustomText(
                content: snapshot.error.toString(),
                size: 24,
                color: Colors.red,
              ),
            );
          }
        }
        return Container(
          color: Color(
            0xff070d2d,
          ),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Color(
        0xff070d2d,
      ),
      child: ListView.builder(
        itemCount: searchData!.length > 10 ? 10 : searchData!.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            query = searchData![index];
            showResults(context);
          },
          title: CustomText(
            content: searchData![index],
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
