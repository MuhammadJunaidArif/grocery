import 'package:flutter/material.dart';
import 'package:grocery_app/const/theme_data.dart';
import 'package:grocery_app/screens/home_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  bool _Isdart = false;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Styles.themeData(true,context),
      home: HomeScreen(),
    );
  }
}
