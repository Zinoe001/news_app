import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_slide.dart';
import 'package:news_app/views/widgets/app_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: AppText.heading2(text: "Welcome to ZNews"),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: AppText.caption(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec non aliquet lorem, et eleifend justo.",
                  multilines: true,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    const Expanded(child: AppTextField()),
                    const SizedBox(width: 7),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kAccentColor.shade700),
                      child: const Icon(Icons.search),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 12),
            ),
            HomeSlide(),
          ],
        ),
      ),
    );
  }
}
