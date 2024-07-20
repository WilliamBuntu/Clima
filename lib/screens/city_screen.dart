import 'package:flutter/material.dart';
import '../utilities/constansts.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  final _controller = TextEditingController();
  bool _validate = false;
  // @override
  // void initState() {
  //   super.initState();
  //   cityName = '';
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    icon: const Icon(Icons.location_city),
                    hintText: 'Enter City Name',
                    errorText: _validate ? 'City Name is required' : null,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _validate = _controller.text.isEmpty;
                  });
                  Navigator.pop(context, cityName);
                },
                child: const Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
