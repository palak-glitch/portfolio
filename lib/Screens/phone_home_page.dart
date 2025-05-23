import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palakportfolio/Provider/current_state.dart';
import 'package:provider/provider.dart';

import '../Consts/constants.dart';

class phoneHomeScreen extends StatefulWidget {
  const phoneHomeScreen({super.key});

  @override
  State<phoneHomeScreen> createState() => _phoneHomeScreenState();
}

class _phoneHomeScreenState extends State<phoneHomeScreen> {
  @override
  Widget build(BuildContext context) {
    CurrentState currentState = Provider.of<CurrentState>(context);

    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.start,
        children: [
          ...List.generate(
            apps.length,
            (index) => Container(
              margin: EdgeInsets.only(top: 50, right: 10, left: 10, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    margin: EdgeInsets.only(bottom: 5),
                    borderRadius:
                        currentState.currentDevice == Devices.ios.iPhone13ProMax
                            ? 8
                            : 100,
                    onPressed: () {
                      if (apps[index].link != null) {
                        //call the launch function
                        currentState.launchinBrowser(apps[index].link!);
                      } else if (apps[index].screen != null) {
                        currentState.changePhoneScreen(
                          apps[index].screen!,
                          false,
                          newtitle: apps[index].title,
                        );
                      }
                    },

                    height: 55,
                    width: 55,
                    backgroundColor: apps[index].bgcolor,
                    child: Center(
                      child: Icon(
                        apps[index].icon,
                        size: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 65,
                    child: Center(
                      child: Text(
                        apps[index].title!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
