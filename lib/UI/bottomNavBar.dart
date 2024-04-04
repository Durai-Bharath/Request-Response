import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shijin_ui/UI/approved.dart';
import 'package:shijin_ui/UI/request.dart';




class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 List<PersistentBottomNavBarItem> _navBarItems() {

  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.request_quote_outlined),
      title: "Request",
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.approval_outlined),
      title: ("Approved"),
      activeColorPrimary: Colors.teal,
      inactiveColorPrimary: Colors.black,
      
    ),
  
  ];
}

   PersistentTabController _controller =
    PersistentTabController(initialIndex: 0);
List<Widget> _buildScreens() {
  
  return [ Request(),Approved()];
}

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
        context,
        
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white54, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.transparent,style: BorderStyle.solid),
          colorBehindNavBar: Colors.teal,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
