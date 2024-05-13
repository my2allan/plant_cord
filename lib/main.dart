import 'package:flutter/material.dart';
import 'package:plant_cord/screens/farmer.dart';
import 'package:plant_cord/screens/garden_info_screen.dart';
import 'package:plant_cord/screens/questionnaire_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FarmerInfoScreen(),
        '/garden': (context) => GardenInfoScreen(),
        '/questionnaire': (context) => QuestionnaireScreen(),
      },
    );
  }
}
