import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Consts/constants.dart';


class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
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
                ),
                Text(
                  "Hi, This is Palak Pandey",
                  style: GoogleFonts.openSans(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                ),
                Text(
                  Introduction,
                  style: GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



