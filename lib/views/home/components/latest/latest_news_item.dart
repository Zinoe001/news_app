import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/news/news_view.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem(
      {Key? key,
      required this.title,
      required this.authur,
      required this.image,
      required this.list})
      : super(key: key);
  final String title;
  final String? image;
  final String? authur;
  final Map<String, dynamic> list;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedNetworkImage(
              imageUrl: image ??
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.buttton(
                  text: title,
                  maxlines: 2,
                ),
                const SizedBox(height: 5),
                authur == null
                    ? AppText.caption(
                        text: "null",
                        color: kAccentColor.shade400,
                      )
                    : AppText.caption(
                        text: "by $authur",
                        color: kAccentColor.shade400,
                      ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewsView(
                          author: authur,
                          content: list["summary"],
                          image: image ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png",
                          time: list["published_date"],
                          title: title,
                        ))),
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
