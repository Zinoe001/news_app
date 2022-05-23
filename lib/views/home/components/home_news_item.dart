import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/news/news_view.dart';

class HomeNewsItem extends StatelessWidget {
  const HomeNewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(35),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 17),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.heading6(text: "Don't be busy with yourself"),
              const SizedBox(height: 5),
              AppText.caption(
                text: "by MAs Latif",
                color: kAccentColor.shade400,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const NewsView())),
            icon: Icon(
              Icons.arrow_forward_rounded,
              color: kSecondaryColor.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
