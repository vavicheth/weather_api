import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_api/helper/get_location.dart';
import 'package:weather_api/models/weather_request.dart';

const apiKey = 'cbd7ef174e17fb0bf168643d33b2082d';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getDataWeather();
  }

  getDataWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    latitude=location.latitude;
    longitude=location.longitude;

    WeatherRequest weatherRequest = WeatherRequest('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey');

    var weatherdata =  await weatherRequest.getData();

    print(weatherdata['coord']['lon']);
    print(weatherdata['coord']['lat']);
    print(weatherdata['main']['temp']);



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
