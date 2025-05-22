import 'dart:ui';

import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palakportfolio/Consts/constants.dart';
import 'package:palakportfolio/Models/color_model.dart';
import 'package:palakportfolio/Provider/current_state.dart';
import 'package:palakportfolio/Screens/phoneScreenWrapper.dart';
import 'package:palakportfolio/Screens/phone_home_page.dart';
import 'package:palakportfolio/widgets/frosted_container.dart';
import 'package:provider/provider.dart';

import '../Provider/theme_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    CurrentState currentState = Provider.of<CurrentState>(
      context,
      listen: false,
    );
    theme.size = MediaQuery.of(context).size;
    theme.widthRatio = theme.size.width / baseWidth;
    theme.heightRatio = theme.size.height / baseHeight;
    bool phone = false;
    if (size.width < 800) {
      phone = true;
    }
    return Scaffold(
      body: Stack(
        children: [
          // Selector<CurrentState, int>(
          Selector<CurrentState, Gradient>(
            selector: (context, provider) => provider.bgGradient,
            // selector: (context, provider) => provider.knobSelected,
            builder: (context, _, _) {
              return Container(
                decoration: BoxDecoration(
                  gradient: currentState.bgGradient,
                  // gradient: colorPalette[currentState.knobSelected].gradient,
                ),
              );
            },
          ),

          // size.height > 600
          //     ? const Rain(
          //   oposite: false,
          //   top: 300,
          // )
          //     : Container(),
          Selector<CurrentState, String>(
            selector: (context, provider) => provider.selectedCloud,
            builder: (context, _, __) {
              return SvgPicture.asset(
                currentState.selectedCloud,
                // width: double.infinity,
                height: size.height,
                fit: BoxFit.cover,
              );
            },
          ),
          // Selector<CurrentState, int>(
          //   selector: (context, provider) => provider.knobSelected,
          //   builder: (context, _, _) {
          //     return SvgPicture.asset(
          //       colorPalette[currentState.knobSelected].svgPath,
          //       height: size.height,
          //       fit: BoxFit.cover,
          //     );
          //   },
          // ),
          // size.height > 600
          //     ? const Rain(
          //   oposite: true,
          //   top: 50,
          // )
          //     : Container(),
          //

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // phone
                  //     ? Container()
                  //     :
                  Column(
                    children: [
                      FrostedContainer(
                        height: 395,
                        width: 247,
                        childG: Container(),
                      ),
                      SizedBox(height: 20),
                      FrostedContainer(
                        height: 175,
                        width: 247,
                        childG: Container(),
                      ),
                    ],
                  ),


                  SizedBox(
                    height: size.height - 100,
                    child: Consumer<CurrentState>(
                      builder: (context, _, _) {
                        return DeviceFrame(
                          device: currentState.currentDevice,
                          screen: Container(
                              decoration: BoxDecoration(
                                gradient: currentState.bgGradient,
                              ),
                              child: ScreenWrapper(
                                  childG: currentState.currentScreen
                              )
                          ),
                        );
                      },
                    ),
                  ),

                  Column(
                    children: [
                      FrostedContainer(
                        height: 395,
                        width: 247,
                        childG: Center(
                          child: Wrap(
                            children: [
                              ...List.generate(
                                colorPalette.length,
                                (index) => Consumer<CurrentState>(
                                  builder: (context, _, _) {
                                    return CustomButton(
                                      margin: EdgeInsets.all(10),
                                      onPressed: () {
                                        currentState.changeGradient(index);
                                      },
                                      animate: true,
                                      pressed:
                                          currentState.bgGradient == index
                                              ? Pressed.pressed
                                              : Pressed.notPressed,
                                      isThreeD: true,
                                      borderRadius: 100,
                                      height: 52,
                                      width: 52,
                                      shadowColor: Colors.white,
                                      backgroundColor:
                                          colorPalette[index].color,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      FrostedContainer(
                        height: 175,
                        width: 247,
                        childG: Container(),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 10),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     ...List.generate(
              //       devices.length,
              //       (index) => Selector<CurrentState, DeviceInfo>(
              //         selector: (context, provider) => provider.currentDevice,
              //         builder: (context, _, _) {
              //           return CustomButton(
              //             backgroundColor: Colors.black,
              //             onPressed: () {
              //               currentState.changeSelectedDevice(
              //                 devices[index].device,
              //               );
              //             },
              //             animate: true,
              //             height: 38,
              //             width: 38,
              //             borderRadius: 100,
              //             isThreeD: true,
              //             pressed:
              //                 currentState.currentDevice ==
              //                         devices[index].device
              //                     ? Pressed.pressed
              //                     : Pressed.notPressed,
              //             shadowColor: Colors.greenAccent,
              //             child: Center(
              //               child: Icon(
              //                 devices[index].icon,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),

              /// bottom button for device selection
              Selector<CurrentState, DeviceInfo>(
                  selector: (context, p1) => p1.currentDevice,
                  builder: (context, _, __) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(devices.length, (index) {
                          return CustomButton(
                            pressed: currentState.currentDevice ==
                                devices[index].device
                                ? Pressed.pressed
                                : Pressed.notPressed,
                            animate: true,
                            borderRadius: 100,
                            isThreeD: true,
                            backgroundColor: Colors.black,
                            width: 37.5,
                            height: 37.5,
                            onPressed: () {
                              currentState.changeSelectedDevice(
                                devices[index].device,
                              );
                            },
                            child: Center(
                              child: Icon(
                                devices[index].icon,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          );
                        })
                      ],
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
