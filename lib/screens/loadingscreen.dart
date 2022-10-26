import 'package:flutter/material.dart';
import 'package:weather_app/screens/Locationscreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getweatherData();

    Navigator.push(context, MaterialPageRoute(builder: ((context) {
      return LocationScreen(
        locationweather: weatherData,
      );
    })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingPlain(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
