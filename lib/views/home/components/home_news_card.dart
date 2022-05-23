import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:news_app/views/news/news_list_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({Key? key, required this.title}) : super(key: key);
  final String title;
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
                  text: title,
                ),
                const Spacer(),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> NewsListView(title: title,))),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 3),
                    decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(10)
                    ),
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
            (context, index) => const HomeNewsItem(),
            childCount: 3,
          ),
        ),
      ],
    );
  }
}
