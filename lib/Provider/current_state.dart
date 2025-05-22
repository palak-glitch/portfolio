import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Consts/constants.dart';
import '../Screens/phone_home_page.dart';


class CurrentState extends ChangeNotifier{
  DeviceInfo currentDevice = Devices.ios.iPhone13ProMax;
  String selectedCloud = "images/blue Cloud.svg";

  Gradient bgGradient = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
     colors: [
       Colors.blue, Colors.black45
     ]
  );
  int selectedColor = 1; // values can range from 0 to 5

  Widget currentScreen = const phoneHomeScreen();
  bool isMainScreen = true;
  String? title;

  void changeSelectedDevice(DeviceInfo device){
    currentDevice = device;
    notifyListeners();
  }

  // void changeGradient(int index){
  //   knobSelected = index;
  //   notifyListeners();
  // }

  void changeGradient(int index) {
    selectedColor = index;
    bgGradient = colorPalette[index].gradient;
    selectedCloud = colorPalette[index].svgPath;
    notifyListeners();
  }

  Future<void> launchinBrowser(String link) async{
    Uri url = Uri.parse(link);

    if(await canLaunchUrl(url)){
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }else{
      print("Something went wrong...");
    }
  }

  void changePhoneScreen(Widget screen, bool isMain, {String? newtitle}){
    currentScreen = screen;
    isMainScreen = isMain;
    title = newtitle;
    notifyListeners();
  }
}