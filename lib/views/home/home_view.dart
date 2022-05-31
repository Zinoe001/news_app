import 'package:flutter/material.dart';
import 'package:news_app/utils/text.dart';
import 'package:news_app/views/home/components/home_news_slide.dart';
import 'package:news_app/views/home/search/search_view.dart';
import 'package:news_app/views/widgets/app_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.data}) : super(key: key);
  final Function(Map<String, dynamic>) data;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: FocusScope.of(context).unfocus,
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
                      Expanded(
                          child: AppTextField(
                        controller: _controller,
                        onSubmitted: (value) {
                          value = _controller.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchView(
                                        title: _controller.text,
                                        data: widget.data,
                                      )));
                        },
                      )),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 12),
              ),
              HomeSlide(
                data: widget.data,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
