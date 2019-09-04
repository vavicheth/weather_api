import 'package:flutter/material.dart';
import 'package:weather_api/helper/get_location.dart';
import 'package:weather_api/models/weather_request.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather_api/ui/weather_screen.dart';

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

  getDataWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    WeatherRequest weatherRequest = WeatherRequest(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=metric&appid=$apiKey');
    var weatherdata = await weatherRequest.getData();

    print(weatherdata);

    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft, child: WeatherScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SpinKitRipple(
        color: Colors.white,
        size: 50.0,
//            controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
      )),
    );
  }
}
