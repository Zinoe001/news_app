import 'package:flutter/material.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NewsListView extends StatefulWidget {
  const NewsListView({
    Key? key,
    required this.title, required this.data,
  }) : super(key: key);

  final String title;
   final Function(Map<String,dynamic>) data;

  @override
  State<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends State<NewsListView> {
  final ScrollController scrollController = ScrollController();
  static final NewsFunctions functions = NewsFunctions();
  late List<Map<String, dynamic>> list = [];
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => getNews(condition: widget.title));
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        getMore();
      }
    });
  }

  Future<void> getMore() async {
    await functions.getMore(newsType: widget.title);
    print("adding to list");
    await getItems(items: widget.title);
  }

  getNews({required String condition}) async {
    //  final String value;
    switch (condition) {
      case "TopHeadlines":
        await functions.getHeadlineNews();
        await getItems(items: condition);
        break;
      case "Business":
        await functions.getBusinessNews();
        await getItems(items: condition);
        break;
      case "Sports":
        await functions.getSportsNews();
        await getItems(items: condition);
        break;
      case "Entertainments":
        await functions.getEntertainmentNews();
        await getItems(items: condition);
        break;
      case "Health":
        await functions.getHealthNews();
        await getItems(items: condition);
        break;
      case "Latest":
        await functions.getLatestNews();
        await getItems(items: condition);
        break;
      default:
    }
  }

  getItems({required String items}) async {
    //  final String value;
    switch (items) {
      case "TopHeadlines":
        await getHeadlineItem();
        break;
      case "Business":
        await getBusinessItem();
        break;
      case "Sports":
        await getSportsItem();
        break;
      case "Entertainments":
        await getEntertainmentItem();
        break;
      case "Health":
        await getHealthItem();
        break;
      case "Latest":
        await getLatestItem();
        break;
      default:
    }
  }

  getHeadlineItem() async {
    setState(() {
      list.addAll(functions.topHeadlines);
      print(list.length);
    });
    
  }

  getEntertainmentItem() async {
    setState(() {
      list.addAll(functions.entertainmentNews);
      print(list.length);
    });
  }

  getSportsItem() async {
    setState(() {
      list.addAll(functions.sportsNews);
      print(list.length);
    });
  }

  getLatestItem() async {
    setState(() {
      list.addAll(functions.latestNews);
      print(list.length);
    });
  }

  getHealthItem() async {
    setState(() {
      list.addAll(functions.healthNews);
      print(list.length);
    });
  }

  getBusinessItem() async {
    setState(() {
      list.addAll(functions.businessNews);
      print(list.length);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPinnedHeader(
              child: Container(
                color: Colors.white,
                height: 35,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),
                    ),
                    const SizedBox(width: 45),
                    AppText.heading2(text: widget.title),
                  ],
                ),
              ),
            ),
            list.isEmpty
                ? const NewsListCardSkeleton()
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => HomeNewsItem(
                              authur: list[index]["author"],
                              title: list[index]["title"],
                              image: list[index]["media"],
                              list: list[index], 
                              data: widget.data,
                            ),
                        childCount: list.length),
                  ),
          ],
        ),
      ),
    );
  }
}

class NewsListCardSkeleton extends StatelessWidget {
  const NewsListCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const HomeNewsItemSkeleton(),
        childCount: 10,
      ),
    );
  }
}
