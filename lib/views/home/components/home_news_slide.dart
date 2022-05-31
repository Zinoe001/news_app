import 'package:flutter/material.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/views/home/components/home_news_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeSlide extends StatefulWidget {
  const HomeSlide({
    Key? key, required this.data,
  }) : super(key: key);
   final Function(Map<String,dynamic>) data;

  @override
  State<HomeSlide> createState() => _HomeSlideState();
}

class _HomeSlideState extends State<HomeSlide> {
  static final NewsFunctions functions = NewsFunctions();
  late List<Map<String, dynamic>> headlineList = [];
  late List<Map<String, dynamic>> entertainmentList = [];
  late List<Map<String, dynamic>> businessList = [];
  late List<Map<String, dynamic>> sportsList = [];
  late List<Map<String, dynamic>> healthList = [];
  late List<Map<String, dynamic>> latestList = [];
  @override
  void initState() {
    Future.wait([
      Future.delayed(const Duration(seconds: 2), () => getHeadlineNews()),
      Future.delayed(const Duration(seconds: 6), () => getLatestNews()),
      Future.delayed(const Duration(seconds: 8), () => getHealthNews()),
      Future.delayed(const Duration(seconds: 11), () => getBusinessNews()),
      Future.delayed(const Duration(seconds: 13), () => getSportsNews()),
      Future.delayed(const Duration(seconds: 16), () => getEntertainmentNews()),
    ]);

    super.initState();
  }

  getHeadlineNews() async {
    await functions.getHeadlineNews();
    setState(() {
      headlineList.addAll(functions.topHeadlines);
    });
  }

  getEntertainmentNews() async {
    await functions.getEntertainmentNews();
    setState(() {
      entertainmentList.addAll(functions.entertainmentNews);
    });
  }

  getSportsNews() async {
    await functions.getSportsNews();
    setState(() {
      sportsList.addAll(functions.sportsNews);
    });
  }

  getLatestNews() async {
    await functions.getLatestNews();
    setState(() {
      latestList.addAll(functions.latestNews);
    });
  }

  getHealthNews() async {
    await functions.getHealthNews();
    setState(() {
      healthList.addAll(functions.healthNews);
    });
  }

  getBusinessNews() async {
    await functions.getBusinessNews();
    setState(() {
      businessList.addAll(functions.businessNews);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        // HomeNewsCard(title: "Popular"),

        HomeNewsCard(
          title: "TopHeadlines",
          list: headlineList, 
          data: widget.data,
        ),
        HomeNewsCard(
          title: "Latest",
          list: latestList,
          data: widget.data,
        ),
        HomeNewsCard(
          title: "Health",
          list: healthList,
          data: widget.data,
        ),
        HomeNewsCard(
          title: "Business",
          list: businessList,
          data: widget.data,
        ),
        HomeNewsCard(
          title: "Sports",
          list: sportsList,
          data: widget.data,
        ),
        HomeNewsCard(
          title: "Entertainments",
          list: entertainmentList,
          data: widget.data,
        ),
      ],
    );
  }
}
