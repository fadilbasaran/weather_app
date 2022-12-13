import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: HomeViewScreen(),
      title: 'Weather',
      debugShowCheckedModeBanner: false,
      
    );
  }
}
