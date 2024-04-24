import 'package:clima2/screens/location_services.dart';
import 'package:flutter/material.dart';
import 'package:clima2/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? lat;
  double? lon;
  final String apiKey = '06d3f0c257bc18b542cb738ede3caced';

  @override
  void initState() {
    super.initState();
    getLocationData();
    print('getlocation');
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    dynamic weatherData =await weatherModel.getLocationWeather();
    // Try and catch block shd be inside a class member i.e methods
    try {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
        ),
      ),
    );
  }
}
