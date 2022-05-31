import 'package:flutter/material.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key, required this.title, required this.data,}) : super(key: key);
  final String title;
  final Function(Map<String,dynamic>) data;
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  static final NewsFunctions functions = NewsFunctions();
  final ScrollController scrollController = ScrollController();
   @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => getSearchedNews());
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
    await getSearchedNews();
  }
  getSearchedNews() async {
    await functions.getSearchedNews(query: widget.title);
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
            SliverToBoxAdapter(
              child: Center(
                child:
                    AppText.heading2(text: "You Searched on ${widget.title}"),
              ),
            ),
            SliverPinnedHeader(
              child: Container(
                color: Colors.white,
                height: 35,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        functions.searchedNews.clear();
                      },
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),
                    ),
                    const SizedBox(width: 45),
                    AppText.heading4(text: "Results"),
                  ],
                ),
              ),
            ),
            functions.searchedNews.isEmpty
                ? const SearchViewCardSkeleton()
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => HomeNewsItem(
                              authur: functions.searchedNews[index]["author"],
                              title: functions.searchedNews[index]["title"],
                              image: functions.searchedNews[index]["image"],
                              list: functions.searchedNews[index], 
                              data: widget.data,
                            ),
                        childCount: functions.searchedNews.length),
                  ),
          ],
        ),
      ),
    );
  }
}

class SearchViewCardSkeleton extends StatelessWidget {
  const SearchViewCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const HomeNewsItemSkeleton(),
        childCount:10,
      ),
    );
  }
}
