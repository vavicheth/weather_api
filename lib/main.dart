import 'package:flutter/material.dart';
import 'package:weather_api/ui/loading_screen.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
      theme: ThemeData.dark().copyWith(

      ),

    );
  }
}
