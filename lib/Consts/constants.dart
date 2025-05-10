import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:palakportfolio/Models/app_model.dart';
import 'package:palakportfolio/Models/device_models.dart';
import 'package:palakportfolio/Screens/homeScreens/about.dart';

import '../Models/color_model.dart';

List<DeviceModel> devices = [
  DeviceModel(device: Devices.android.samsungGalaxyS20, icon: Icons.android),
  DeviceModel(device: Devices.ios.iPhone13ProMax, icon: Icons.apple),
  DeviceModel(device: Devices.ios.iPadAir4, icon: Icons.tablet_mac_outlined),
];

List<ColorModel> colorPalette = [
  ColorModel(
    svgPath: "images/red Cloud.svg",
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.yellowAccent, Colors.deepOrange],
    ),
    color: Colors.yellow,
  ),
  ColorModel(
    svgPath: "images/blue Cloud.svg",
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [Colors.lightBlueAccent, Colors.blue.shade700],
    ),
    color: Colors.blue,
  ),
];



List<AppModel> apps = [
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person, screen: AboutMe()),
  AppModel(title: "Skills", bgcolor: Colors.white, icon: Icons.language),
  AppModel(title: "LinkedIn", bgcolor: Colors.white, icon: Icons.link, link: linkedIn),
  AppModel(title: "Email", bgcolor: Colors.white, icon: Icons.email_outlined, link: email),
  AppModel(title: "Experience", bgcolor: Colors.white, icon: Icons.self_improvement),
  AppModel(title: "Education", bgcolor: Colors.white, icon: Icons.book_outlined),
  AppModel(title: "Github", bgcolor: Colors.white, icon: Icons.gamepad, link: gitHub),

  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person),
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person),
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person),
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person),
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person),
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person),
];


const String linkedIn = "https://www.linkedin.com/in/palak-pandey-06ab46114/";
const String email = "palakpandey2912@gmail.com";
const String gitHub = "https://github.com/palak-glitch/";
const String resumeLink = "";
const String Introduction = "Welcome to my portfolio website, this website is highly inspired(almost copied) "
    "from a developer. I am a flutter developer with 3.6+ years of experience.";

