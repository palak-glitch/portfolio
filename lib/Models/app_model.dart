import 'package:flutter/cupertino.dart';

class AppModel {
  String? title;
  String? assetPath;
  IconData? icon;
  Color? bgcolor;
  Widget? screen;
  String? link;

  AppModel({
    required this.title,
    this.assetPath,
    this.icon,
    required this.bgcolor,
    this.screen,
    this.link,
  }) : assert(icon == null || assetPath == null);
}


