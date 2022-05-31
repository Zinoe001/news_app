import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/save/components/save_news_card.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SavedView extends StatefulWidget {
  const SavedView({
    Key? key, required this.item,
  }) : super(key: key);
  final List<Map<String,dynamic>> item;
  @override
  State<SavedView> createState() => _SavedViewState();
}

class _SavedViewState extends State<SavedView> {
  late List<Map<String, dynamic>> previousItem = widget.item.reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPinnedHeader(
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                color: Colors.white,
                height: 35,
                child: Row(
                  children: [
                    AppText.heading2(
                      text: "Saved News",
                      color: kSecondaryColor,
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => SavedNewsCard(
                        authur: previousItem[index]["author"],
                        title: previousItem[index]["title"],
                        image: previousItem[index]["image"],
                        list: previousItem[index],
                      ),
                  childCount: previousItem.length),
            ),
          ],
        ),
      ),
    );
  }
}
