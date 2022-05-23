import 'package:flutter/material.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_item.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({Key? key, required this.title}) : super(key: key);

final String title;
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
                      onPressed: ()=> Navigator.pop(context),
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
                  (context, index) => const HomeNewsItem(),
                  childCount: 15),
            ),
          ],
        ),
      ),
    );
  }
}
