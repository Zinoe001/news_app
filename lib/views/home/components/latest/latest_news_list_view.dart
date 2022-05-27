import 'package:flutter/material.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/latest/latest_news_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class LatestNewsListView extends StatelessWidget {
  const LatestNewsListView({Key? key, required this.title, required this.list}) : super(key: key);

  final String title;
  final List<Map<String,dynamic>> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                    AppText.heading2(text: title),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => LatestNewsItem(
                        authur: list[index]["author"],
                        title: list[index]["title"],
                        image: list[index]["media"],
                        list: list[index],
                      ),
                  childCount: 15),
            ),
          ],
        ),
      ),
    );
  }
}
