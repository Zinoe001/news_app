import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';


class SavedNewsCard extends StatelessWidget {
  const SavedNewsCard(
      {Key? key,
      required this.title,
      required this.authur,
      required this.image,
      required this.list,})
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
                  "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
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
        ],
      ),
    );
  }
}
