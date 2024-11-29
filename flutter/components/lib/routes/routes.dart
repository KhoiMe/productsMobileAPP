import 'package:components/screens/Avatar.dart';
import 'package:components/screens/SegmentedButton.dart';
import 'package:components/screens/dismissible.dart';
import 'package:flutter/material.dart';

// home
import 'package:components/models/routes.dart';

// screens
import 'package:components/screens/home.dart';
import 'package:components/screens/listView3.dart';
import 'package:components/screens/listView2.dart';
import 'package:components/screens/Cards.dart';

class AppRoutes {
  static const initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
        name: "Listview 1",
        icon: Icons.list,
        route: "Listview1",
        screen: const HomeScreen()),
    MenuOption(
        name: "Card",
        icon: Icons.tv,
        route: "CardScreens",
        screen: const CardScreen()),
    MenuOption(
        name: "list2",
        icon: Icons.tv,
        route: "Listview2",
        screen: const ListView2()),
    MenuOption(
        name: "SegmentendButton",
        icon: Icons.drag_handle,
        route: "SegmentedButton",
        screen: const SegmentedView()),
    MenuOption(
        name: "Dismissable list (Snooze)",
        icon: Icons.mic,
        route: "dismissible",
        screen: const DismissibleListVIEW()),
    MenuOption(
        name: "list3",
        icon: Icons.mic,
        route: "Listview3",
        screen: const ListView3()),
    MenuOption(
        name: "avatar",
        icon: Icons.route,
        route: "AvatarScreen",
        screen: const AvatarScreen())
  ];

  static Map<String, Widget Function(BuildContext context)> getRoutes() {
    Map<String, Widget Function(BuildContext context)> appRoutes = {};
    appRoutes.addAll({
      'home': (BuildContext context) => const HomeScreen(),
      // "list": (BuildContext context) => const ListView2()
    });

    for (var option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}
