import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_movie_app/helper/text.dart';
import 'package:simple_movie_app/models/production_company.dart';
import 'package:simple_movie_app/repository/favorited_repository.dart';
import 'package:simple_movie_app/screens/empty_companies_screen.dart';

class CompaniesScreen extends StatefulWidget {
  const CompaniesScreen({Key? key}) : super(key: key);

  @override
  _CompaniesScreenState createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritedRepository>(
      builder: (BuildContext context, repository, child) {
        List<ProductionCompany> companies =
            repository.getAllProductionCompany();
        if (companies.isNotEmpty) {
          return ListView.separated(
            itemCount: companies.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) => ListTile(
              title: CustomText(
                content: companies[index].name,
              ),
            ),
          );
        } else {
          return const EmptyCompaniesScreen();
        }
      },
    );
  }
}
