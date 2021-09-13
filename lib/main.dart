import 'package:flutter/material.dart';
import 'package:untitled/constants/my_colors.dart';
import 'package:untitled/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Facebook Feed Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: MyColors.scaffoldColor,
      ),
      home: HomeScreen(),
    );
  }
}



