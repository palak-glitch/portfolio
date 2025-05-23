import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:palakportfolio/Models/app_model.dart';
import 'package:palakportfolio/Models/device_models.dart';
import 'package:palakportfolio/Screens/homeScreens/about.dart';
import 'package:palakportfolio/Screens/homeScreens/education.dart';
import 'package:palakportfolio/Screens/homeScreens/experience.dart';
import 'package:palakportfolio/Screens/homeScreens/skills.dart';

import '../Models/Job_Experience_Models.dart';
import '../Models/Skills_model.dart';
import '../Models/color_model.dart';

const double baseHeight = 790;
const double baseWidth = 1440;

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
  ColorModel(
      svgPath: "images/Green.svg",
      color: const Color(0xff00d6ca),
      gradient: const LinearGradient(
        colors: [Color(0xff0DAE15), Color(0xff00d6ca)],
        stops: [0, 1],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      )),
  ColorModel(
    svgPath: "images/Dark_Blue.svg",
    color: const Color(0xff123cd1),
    gradient: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(-0.31, 0.95),
      colors: [Color(0xFF1042F4), Color(0x00203EA6)],
    ),
  ),
  ColorModel(
    svgPath: "images/purple.svg",
    color: Colors.purple,
    gradient: const LinearGradient(
      colors: [Color(0xffc95edb), Colors.black12],
      stops: [0, 1],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
];

List<AppModel> apps = [
  AppModel(title: "About", bgcolor: Colors.white, icon: Icons.person, screen: AboutMe()),
  AppModel(title: "Skills", bgcolor: Colors.white, icon: Icons.language, screen: Skills()),
  AppModel(title: "LinkedIn", bgcolor: Colors.white, icon: Icons.link, link: linkedIn),
  AppModel(title: "Email", bgcolor: Colors.white, icon: Icons.email_outlined, link: email),
  AppModel(title: "Experience", bgcolor: Colors.white, icon: Icons.self_improvement, screen: Experience()),
  AppModel(title: "Education", bgcolor: Colors.white, icon: Icons.book_outlined, screen: Education()),
  AppModel(title: "Github", bgcolor: Colors.white, icon: Icons.gamepad, link: gitHub),
];


const String linkedIn = "https://www.linkedin.com/in/palak-pandey-06ab46114/";
const String email = "palakpandey2912@gmail.com";
const String gitHub = "https://github.com/palak-glitch/";
const String resumeLink = "";
const String Introduction = "Welcome to my portfolio website, this website is highly inspired(almost copied) "
    "from a developer. I am a flutter developer with 3.8+ years of experience.";


final List<JobExperience> education = [
  JobExperience(
    color: Colors.blue,
    location: "Vadodara, Gujarat",
    title: 'Computer Science Engineering',
    company: 'ITM sls',
    startDate: 'Aug 2013',
    endDate: 'june 2017',
    bulletPoints: [
      'Developing Apps single handedly from scratch to end. Integrating State management (Provider, Riverpod),3rd party tools, payment gateways,'
          'firebase with a knowledge of Git, Slack, Jira, Postman, AGILE methodology',
    ],
  ),
];

final List<JobExperience> jobExperiences = [
  JobExperience(
    color: Colors.orangeAccent,
    location: "Pune, Maharashtra - India",
    title: 'Computer Engineering',
    company: 'Telemerge IT Services Pvt. Ltd.',
    startDate: 'Feb 2025',
    endDate: 'Present',
    bulletPoints: [
      "Currently Working for TCS as contractual role!",
    ],
  ),
  JobExperience(
    color: Colors.greenAccent,
    location: "Ahmedabad, Gujarat (Hybrid)",
    title: 'Associate Mobile Developer',
    company: 'Entrust Software Development India',
    startDate: 'July 2021',
    endDate: 'Jan 2025',
    bulletPoints: [
      'Developing Apps single handedly from scratch to end. Integrating State management (Provider, Riverpod),3rd party tools, payment gateways,'
          'firebase with a knowledge of Git, Slack, Jira, Postman, AGILE methodology',
    ],
  ),
  JobExperience(
    color: Colors.redAccent,
    location: "Delhi - India (Remote)",
    title: 'Junior Flutter Developer',
    company: 'Black Console',
    startDate: 'Aug 2020',
    endDate: 'Jan 2021',
    bulletPoints: [
      'Developing Apps single handedly from scratch to end. Integrating State management (Provider, Riverpod),3rd party tools, payment gateways,'
          'firebase with a knowledge of Git, Slack, Jira, Postman, AGILE methodology',
    ],
  ),
];

List<SkillsModel> skills = [
  SkillsModel(skillName: "Flutter", colorS: Colors.blue, iconPath: "random"),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.purple,
  ),
  SkillsModel(
    skillName: "Github",
    colorS: Colors.purple,
  ),
  SkillsModel(
    skillName: "Dart",
    colorS: Colors.blue,
  ),
  SkillsModel(
    skillName: "Provider",
    colorS: Colors.orange,
  ),
  SkillsModel(
    skillName: "Riverpod",
    colorS: Colors.blue,
  ),
  // SkillsModel(
  //   skillName: "CI/CD",
  //   colorS: Colors.yellow,
  // ),
  // SkillsModel(
  //   skillName: "Code Magic",
  //   colorS: Colors.orange,
  // ),
  SkillsModel(
    skillName: "Firebase",
    colorS: Colors.pink,
  ),
  SkillsModel(
    skillName: "REST API",
    colorS: Colors.pink,
  ),
  // SkillsModel(
  //   skillName: "GraphQL",
  //   colorS: Colors.yellow,
  // ),
  // SkillsModel(
  //   skillName: "REST API",
  //   colorS: Colors.yellow,
  // ),
];

List<SkillsModel> languages = [
  SkillsModel(skillName: "Hindi", colorS: Colors.black),
  SkillsModel(skillName: "English", colorS: Colors.blueGrey),
  SkillsModel(skillName: "Japanese", colorS: Colors.orange),
];
