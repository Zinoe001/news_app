import 'package:flutter/material.dart';
import 'package:news_app/views/home/components/health/health_news_card.dart';
// import 'package:news_app/views/home/components/latest/latest_news_card.dart';
import 'package:news_app/views/home/components/news_card/business_news_card.dart';
import 'package:news_app/views/home/components/news_card/entertainment_news_card.dart';
import 'package:news_app/views/home/components/news_card/sports_news_card.dart';
import 'package:news_app/views/home/components/news_card/top_headline_news_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeSlide extends StatelessWidget {
  HomeSlide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: const [
        // HomeNewsCard(title: "Popular"),
        // HomeNewsCard(title: "Trending"),
        // LatestNewsCard(title: "Latest"),
        TopHeadlinesNewsCard(title: "TopHeadlines"),
        BusinessNewsCard(title: "Business"),
        HealthNewsCard(title: "Health"),
        SportsNewsCard(title: "Sports"),
        EntertainmentNewsCard(title: "Entertainments"),
      ],
    );
  }
}
