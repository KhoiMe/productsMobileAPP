import 'package:flutter/material.dart';

class MenuOption {
  final String name;
  final IconData icon;
  final String route;
  final Widget screen;

  MenuOption(
      {required this.name,
      required this.icon,
      required this.route,
      required this.screen});
}
