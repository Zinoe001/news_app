import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:news_app/views/news/news_list_view.dart';
import 'package:sliver_tools/sliver_tools.dart';

class HomeNewsCard extends StatelessWidget {
  const HomeNewsCard({
    Key? key,
    required this.title, 
    required this.list, required this.data,
  }) : super(key: key);
  final String title;
  final List<Map<String,dynamic>> list;
   final Function(Map<String,dynamic>) data;
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
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NewsListView(
                                title: title, 
                                data: data,
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
        list.isEmpty
            ? const HomeNewsCardSkeleton()
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => HomeNewsItem(
                    authur: list[index]["author"],
                    title: list[index]["title"],
                    image: list[index]["media"],
                    list: list[index], 
                    data: data,
                  ),
                  childCount: 4,
                ),
              ),
      ],
    );
  }
}

class HomeNewsCardSkeleton extends StatelessWidget {
  const HomeNewsCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const HomeNewsItemSkeleton(),
        childCount: 4,
      ),
    );
  }
}
