import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:news_app/views/news/news_list_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class EntertainmentNewsCard extends StatefulWidget {
  const EntertainmentNewsCard({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  State<EntertainmentNewsCard> createState() => _EntertainmentNewsCardState();
}

class _EntertainmentNewsCardState extends State<EntertainmentNewsCard> {
  static final NewsFunctions functions = NewsFunctions();
  @override
  void initState() {
    Future.delayed(
        const Duration(seconds: 2), () => getEntertainmentNews());
    setState(() {});
    super.initState();
  }
getEntertainmentNews()async{
  await functions.getEntertainmentNews();
  setState(() {
    functions.entertainmentNews;
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
                          builder: (context) => NewsListView(
                                title: widget.title,
                                list: functions.entertainmentNews,
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
         functions.entertainmentNews.isEmpty
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              :SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => HomeNewsItem(
                    authur: functions.entertainmentNews[index]["author"],
                    title: functions.entertainmentNews[index]["title"],
                    image: functions.entertainmentNews[index]["urlToImage"],
              list: functions.entertainmentNews[index],

                  ),
                  childCount: functions.entertainmentNews.length~/5,
                ),
              ),
      ],
    );
  }
}
