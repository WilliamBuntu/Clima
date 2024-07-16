import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../services/location.dart';
import '../services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
      var weatherData = await weatherModel.getCityWeather();

    BuildContext? currentContext = context; // Store the context locally

    if (mounted) {
      Navigator.push(currentContext, MaterialPageRoute(builder: (context) {
        return LocationScreen(locationWaether: weatherData);
      }));
    }
  }

  // var condtion = jsonDecode(data)['weather'][0]['id'];
  // var temperature = jsonDecode(data)['main']['temp'];
  // var cityName = jsonDecode(data)['name'];

  @override
  Widget build(BuildContext context) {
    // getData();
    return const Scaffold(
      body: Center(
          child: SpinKitSpinningLines(
        color: Colors.white70,
        size: 100.0,
      )),
    );
  }
}
