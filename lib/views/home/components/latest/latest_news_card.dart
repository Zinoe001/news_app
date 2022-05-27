import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:news_app/views/home/components/latest/latest_news_list_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class LatestNewsCard extends StatefulWidget {
  const LatestNewsCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LatestNewsCard> createState() => _LatestNewsCardState();
}

class _LatestNewsCardState extends State<LatestNewsCard> {
  static final NewsFunctions functions = NewsFunctions();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => functions.getLatestNews());
    setState(() {
      functions.latestNews;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverPinnedHeader(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.white,
            height: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText.heading6(
                  text: widget.title,
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LatestNewsListView(
                                title: widget.title,
                                list: functions.latestNews["articles"],
                              ))),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                    decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AppText.small(text: "See more", color: kPrimaryColor),
                          Icon(Icons.keyboard_arrow_right_outlined,
                              color: kPrimaryColor, size: 15),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => functions.healthNews.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : HomeNewsItem(
                    authur: functions.latestNews["articles"][index]["author"],
                    title: functions.latestNews["articles"][index]["title"],
                    image: functions.latestNews["articles"][index]["media"],
                    list: functions.latestNews["articles"][index],
                  ),
            childCount: functions.latestNews.length,
          ),
        ),
      ],
    );
  }
}
