import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';

class NewsView extends StatelessWidget {
  const NewsView(
      {Key? key,
      required this.title,
      required this.author,
      required this.image,
      required this.time,
      required this.content})
      : super(key: key);
  final String title;
  final String? author;
  final String image;
  final String? time;
  final String? content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                  ),
                ),
                const SizedBox(width: 90),
                AppText.heading5(text: "Article"),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark,
                    color: kSecondaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Container(
                  height: 75,
                  width: 5,
                  color: kSecondaryColor,
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: AppText.heading4(
                    text: title,
                    multilines: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "by ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: author ?? "Anonymous",
                        style: TextStyle(color: kSecondaryColor, fontSize: 12),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                CircleAvatar(
                  radius: 2,
                  backgroundColor: kSecondaryColor,
                ),
                const SizedBox(width: 5),
                time == null ? AppText.caption(text: "No Date") :
                AppText.caption(
                    text: DateFormat("MMMM dd yyyy")
                        .format(DateTime.parse(time!.substring(0, 10))))
              ],
            ),
            const SizedBox(height: 12),
            AspectRatio(
              aspectRatio: 225 / 175,
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(
                      boxShadow:  [
                        BoxShadow( 
                          color: kAccentColor,
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0,1)
                        )
                      ],
                      borderRadius: BorderRadius.circular(20)),
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            AppText.buttton(
              text: content ?? "No Content for this News",
              multilines: true,
            )
          ]),
    );
  }
}
