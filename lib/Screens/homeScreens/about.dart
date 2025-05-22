import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../Consts/constants.dart';


class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f4e7),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.face_2, size: 70,),
                ),
                Container(
                  alignment: Alignment.center,
                  padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    "Hi, This is Palak Pandey",
                    style: GoogleFonts.openSans(
                      color: Colors.black,
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  Introduction,
                  style: GoogleFonts.openSans(
                      color: Colors.purple,
                      fontSize: 15, fontWeight: FontWeight.w500),
                ).animate().fadeIn(duration: const Duration(milliseconds: 500)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



