import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palakportfolio/Consts/constants.dart';
import 'package:palakportfolio/Provider/current_state.dart';
import 'package:palakportfolio/Screens/phoneScreenWrapper.dart';
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
                  phone
                      ? Container() :
                  Column(
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.01)
                          ..rotateY(-0.06),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(
                              top: 0, bottom: 10 * theme.heightRatio),
                          child: FrostedContainer(
                            childG: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(2, 2, -0.01)
                                  ..rotateY(-0.06),
                                alignment: FractionalOffset.center,
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Center(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.all(10),
                                          child: AutoSizeText(
                                            'Mobile Developer',
                                            style: GoogleFonts.exo(
                                                fontSize: 35,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold),
                                            maxFontSize: 35,
                                            minFontSize: 15,
                                            maxLines: 1,
                                          ).animate().fadeIn(
                                              delay: .8.seconds,
                                              duration: .7.seconds),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            height: 395 * theme.heightRatio,
                            width: 247.5 * theme.widthRatio,
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.009999)
                          ..rotateY(-0.07),
                        alignment: Alignment.topCenter,
                        child: FrostedContainer(
                          height: 175,
                          width: 247,
                          childG: Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              height: 175.5 * theme.heightRatio,
                              width: 245 * theme.widthRatio,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.connect_without_contact_rounded, size: 50 * theme.widthRatio *
                                      theme.heightRatio, color: Colors.deepOrange,),
                                  SizedBox(
                                    height: 10 * theme.heightRatio,
                                  ),
                                  Flexible(
                                    child: AutoSizeText(
                                        "Let's Connect",
                                        style: GoogleFonts.openSans(
                                            color: Colors.black,
                                            fontSize: 28 * theme.widthRatio *
                                                theme.heightRatio, fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                      maxFontSize: 28,
                                      minFontSize: 15,
                                    ).animate().fadeIn(
                                        delay: 1.seconds, duration: .7.seconds),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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

                  phone
                      ? Container()
                      : Column(
                    children: [
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.01)
                          ..rotateY(0.06),
                        alignment: Alignment.bottomCenter,
                        child: FrostedContainer(
                          height: 395 * theme.heightRatio,
                          width: 247.5 * theme.widthRatio,
                          childG: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  ...List.generate(
                                    colorPalette.length,
                                        (index) =>
                                        Consumer<CurrentState>(
                                            builder: (context, _, __) {
                                              return CustomButton(
                                                margin: const EdgeInsets.all(
                                                    10),
                                                pressed:
                                                currentState.selectedColor ==
                                                    index
                                                    ? Pressed.pressed
                                                    : Pressed.notPressed,
                                                animate: true,
                                                borderRadius: 100,
                                                shadowColor: Colors
                                                    .blueGrey[50],
                                                isThreeD: true,
                                                backgroundColor:
                                                colorPalette[index].color,
                                                width: 50 * theme.widthRatio,
                                                height: 50 * theme.widthRatio,
                                                onPressed: () {
                                                  currentState
                                                      .changeGradient(index);
                                                },
                                              );
                                            }),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.00999)
                          ..rotateY(0.06),
                        alignment: Alignment.topCenter,
                        child: Container(
                          margin:
                          const EdgeInsets.only(top: 0, bottom: 10),
                          child: FrostedContainer(
                            childG: Center(
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding:
                                EdgeInsets.all(10 * theme.widthRatio),
                                child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          '"Don\'t run after success run after perfection success will follow."',
                                          style: GoogleFonts.inter(
                                            // fontSize: 30,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400),
                                          maxFontSize: 25,
                                          minFontSize: 10,
                                          maxLines: 3,
                                        ),
                                        Align(
                                            alignment: Alignment.bottomRight,
                                            child: AutoSizeText(
                                              '-Baba Ranchhoddas',
                                              style: GoogleFonts.inter(
                                                // fontSize: 12,
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontWeight:
                                                  FontWeight.w400),
                                              maxFontSize: 12,
                                              minFontSize: 6,
                                              maxLines: 1,
                                            )),
                                      ],
                                    )),
                              ),
                            ).animate().fadeIn(
                                delay: 1.seconds, duration: .7.seconds),
                            height: 175.5 * theme.heightRatio,
                            width: 245 * theme.widthRatio,
                          ),
                        ),
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
