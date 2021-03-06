import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/news/news_view.dart';
import 'package:news_app/views/widgets/skeleton.dart';

class HomeNewsItem extends StatelessWidget {
  const HomeNewsItem(
      {Key? key,
      required this.title,
      required this.authur,
      required this.image,
      required this.list, 
      required this.data,})
      : super(key: key);
  final String title;
  final String? image;
  final String? authur;
  final Map<String, dynamic> list;
  final Function(Map<String,dynamic>) data;
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
                        text: "by Anonymous",
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
                      getData: data,
                          author: authur,
                          content: list["summary"],
                          image: image ??
                              "https://thumbs.dreamstime.com/b/no-image-available-icon-flat-vector-no-image-available-icon-flat-vector-illustration-132482953.jpg",
                          time: list["published_date"],
                          //     time: DateFormat("EEE MMMM dd").format(
                          // DateTime.fromMillisecondsSinceEpoch(
                          //     list["dateLong"] * 1000)),
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

class HomeNewsItemSkeleton extends StatelessWidget {
  const HomeNewsItemSkeleton({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          const Skeleton(
            height: 55,
            width: 55,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Skeleton(
                  height: 20,
                  width: double.infinity,
                ),
                SizedBox(height: 5),
                Skeleton(
                  height: 20,
                  width: 175,
                )
              ],
            ),
          ),
          const SizedBox(width: 45),
        ],
      ),
    );
  }
}
