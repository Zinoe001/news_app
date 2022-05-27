import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/health/health_news_list_view.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HealthNewsCard extends StatefulWidget {
  const HealthNewsCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HealthNewsCard> createState() => _HealthNewsCardState();
}

class _HealthNewsCardState extends State<HealthNewsCard> {
  static final NewsFunctions functions = NewsFunctions();
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () => getHealthNews());
    super.initState();
  }
getHealthNews()async{
  await functions.getHealthNews();
  setState(() {
    functions.healthNews;
  });
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
                          builder: (context) => HealthNewsListView(
                                title: widget.title,
                                list: functions.healthNews,
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
        functions.healthNews.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              :
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => functions.healthNews.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : HomeNewsItem(
                    authur: functions.healthNews[index]["author"],
                    title: functions.healthNews[index]["title"],
                    image: functions.healthNews[index]["image"],
                    list: functions.healthNews[index],
                  ),
            childCount: functions.healthNews.length ~/ 5,
          ),
        ),
      ],
    );
  }
}
