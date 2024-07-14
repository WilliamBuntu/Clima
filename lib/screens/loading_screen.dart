import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:geolocator/geolocator.dart';
import '../services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  void getData() async {
    //https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=YOUR_API_KEY

    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=${dotenv.env['API_KEY']}')); //dotenv

    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //Get the current location
            // getLocation();
            getData();
          },
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}
