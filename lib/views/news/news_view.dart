import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: ()=> Navigator.pop(context),
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
                  child: AppText.heading1(
                    text: "Don't be busy with yourself",
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
                        text: "Mas latif",
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
                AppText.caption(text: "February 27 2022")
              ],
            ),
            const SizedBox(height: 12),
            AspectRatio(
              aspectRatio: 225 / 175,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              ),
            ),
            const SizedBox(height: 12),
            AppText.buttton(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non aliquet lorem, et eleifend justo. "
                  "Aenean vitae feugiat nibh, quis pellentesque magna. Vestibulum ut purus a tellus volutpat pretium ut "
                  "finibus eros. Nam non fringilla sem, ut efficitur ante. Cras quis sem in tortor tempus egestas. "
                  "Curabitur fermentum mollis tortor, ac dignissim elit mattis sit amet. Curabitur eu ex id ipsum "
                  "efficitur fringilla. Nunc in dignissim justo. Proin sit amet dignissim turpis. Nulla nec nibh nisi."
                  " Aliquam convallis leo eu augue tempor lacinia. Cras risus nulla, sagittis non velit a, tempor maximus"
                  " erat. Praesent in sodales magna, id ultricies orci. Ut fermentum neque eu lacinia porta. Maecenas"
                  " tincidunt, tellus id lacinia tincidunt, sapien velit aliquet metus, a tincidunt purus sapien sit amet "
                  "urna. Ut sagittis nisl nec mi varius laoreet. Fusce imperdiet neque lectus, vitae imperdiet lacus "
                  "consectetur et. In eget nulla pharetra, consectetur elit id, egestas augue. Mauris auctor ac lectus "
                  "vitae fringilla. Vivamus nec dictum ipsum, nec pulvinar quam. Nam a risus condimentum, ullamcorper orci "
                  "nec, sollicitudin nisl. Maecenas tellus tortor, pulvinar sed ante vel, gravida blandit diam. Curabitur "
                  "consectetur imperdiet nisi, mollis dictum mi venenatis at. Nullam in nibh ultricies, venenatis magna at,"
                  " ultricies sapien.Phasellus eleifend efficitur augue, nec vehicula sapien sagittis quis. In imperdiet"
                  " ipsum et fringilla feugiat. Vestibulum lobortis consequat arcu, suscipit aliquet sem pretium sed. "
                  "Phasellus quis mattis felis. Aenean id erat elit. Integer non molestie leo, quis sagittis metus. "
                  "Donec maximus velit at lorem gravida sodales. Mauris vehicula suscipit lacus, vel ullamcorper arcu "
                  "venenatis a. Ut nisl sapien, ultricies nec arcu aliquam, lobortis accumsan sem. Orci varius natoque "
                  "penatibus et magnis dis parturient montes, nascetur ridiculus mus. Cras id orci non mi rutrum viverra"
                  " eget sit amet est. Cras sem lacus, luctus et ultricies semper, porttitor quis libero. Vivamus gravida,"
                  " dolor gravida dignissim laoreet, dui velit molestie diam, vel imperdiet elit turpis at nisl. Aliquam nec"
                  " tincidunt eros, vel suscipit orci. In sit amet dolor sit amet mi convallis posuere at in ipsum.",
                  multilines: true,
            )
          ]),
    );
  }
}
