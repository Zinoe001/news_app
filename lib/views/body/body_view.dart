import 'package:flutter/material.dart';
import 'package:news_app/services/preferences_services.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/utils/function.dart';
import 'package:news_app/views/home/home_view.dart';
import 'package:news_app/views/profille/profile_view.dart';
import 'package:news_app/views/save/save_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BodyView extends StatefulWidget {
  const BodyView({Key? key}) : super(key: key);

  @override
  State<BodyView> createState() => _BodyViewState();
}

class _BodyViewState extends State<BodyView> {
  final PreferencesServices _prefs = PreferencesServices();
  final NewsFunctions _functions = NewsFunctions();
  late List<Map<String, dynamic>> list = [];
  @override
  void initState() {
    saved();
    super.initState();
  }

// setStateIfMounted(() {
//
//       list;
//       print(list.length);
//     });
//  void setStateIfMounted(f) {
//     if (mounted) setState(f);
//   }
  saved() {
    print("loading");
    if (_functions.savedNews.isEmpty) {
      getSaved();
    } else {
      list = _functions.savedNews;
      print(list.length);
    }
    print("done");
  }

  Future<void> getSaved() async {
    await _prefs.init();
    setState(() {
      print("getting data from saved list");
      _functions.savedNews.insertAll(0, _prefs.storedList);
      print(_functions.savedNews);
      print(_functions.savedNews.length);
    });
  }

  data(Map<String, dynamic> item) {
    print("taking data");
    print(item);
    setState(() {
      list.add(item);
      list.toSet().toList();
    });
    print(list);

    _prefs.saveNewsList(list);
    print("done");
  }

  List<Widget> _buildScreens() {
    return [
      SavedView(
        item: list,
      ),
      HomeView(
        data: data,
      ),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: ("Save"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home,
          color: kSecondaryColor,
        ),
        title: ("Home"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: kPrimaryColor,
        inactiveColorPrimary: kSecondaryColor,
      ),
    ];
  }

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
