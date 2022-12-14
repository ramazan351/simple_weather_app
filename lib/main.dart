import 'package:flutter/material.dart';
import 'package:simple_weather_project/screens/home/home_screen.dart';
import 'package:simple_weather_project/screens/app_drawer/drawer_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyDrawer(child: MyHomeScreen()),
    );
  }
}
