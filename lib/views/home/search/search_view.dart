import 'package:flutter/material.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/latest/latest_news_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
    static final NewsFunctions functions = NewsFunctions();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getSearchedNews());
    super.initState();
  }

  getSearchedNews() async {
    await functions.getSearchedNews();
    setState(() {
      functions.searchedNews;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: Center(
              child: AppText.heading4(text: "You Searched on"),
            ),),
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
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => LatestNewsItem(
                        authur: functions.searchedNews[index]["author"],
                        title: functions.searchedNews[index]["title"],
                        image: functions.searchedNews[index]["image"],
                        list: functions.searchedNews[index],
                      ),
                  childCount: 15),
            ),
          ],
        ),
      ),
    );
  }
}
