import 'package:flutter/material.dart';
import 'package:news_app/views/home/components/home_news_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeSlide extends StatelessWidget {
  HomeSlide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: const  [
        HomeNewsCard(title: "Popular"),
        HomeNewsCard(title: "Trending"),
        HomeNewsCard(title: "Newest"),
        HomeNewsCard(title: "Top"),
        HomeNewsCard(title: "Politics"),
        HomeNewsCard(title: "Art"),
        HomeNewsCard(title: "Sports"),
        HomeNewsCard(title: "Entertainments"),
      ],
    );
  }
}
