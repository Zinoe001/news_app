import 'package:flutter/material.dart';
import 'package:news_app/utils/color.dart';
import 'package:news_app/views/home/home_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BodyView extends StatelessWidget {
  BodyView({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const Scaffold(),
      HomeView(),
      const Scaffold(),
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
        icon: Icon(Icons.home,color: kSecondaryColor,),
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

  final PersistentTabController _controller = PersistentTabController(initialIndex: 1);

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
