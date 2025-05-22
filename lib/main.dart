// ignore_for_file: deprecated_member_use

import 'package:palakportfolio/starry_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/theme_provider.dart';
import 'Screens/HomePage.dart';
import 'Provider/current_state.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CurrentState()),
      ],
      child: MaterialApp(
        title: 'Starry Sky Home',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        home: const Homepage(),
        // home: const StarryHomePage(),
      )
    );
  }
}



///…or create a new repository on the command line
// echo "# Portfolio" >> README.md
// git init
// git add README.md
// git commit -m "first commit"
// git branch -M main
// git remote add origin https://github.com/palak-glitch/Portfolio.git
// git push -u origin main
/// …or push an existing repository from the command line
// git remote add origin https://github.com/palak-glitch/Portfolio.git
// git branch -M main
// git push -u origin main

