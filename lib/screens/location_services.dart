import 'package:clima2/screens/city_screens.dart';
import 'package:clima2/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima2/utilities/constants.dart';
import 'dart:convert';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.locationWeather});
  final dynamic locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  dynamic temprature;
  String? cityName;
  String? weatherIcon;
  String? weatherMessage;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
         temprature =0;
         weatherIcon='Error';
         weatherMessage='Unable to get weather data';
        cityName= '';
        return;
      }
      double temp = jsonDecode(weatherData)['main']['temp'];
      temprature = temp.toInt();
      cityName = jsonDecode(weatherData)['name'];
      int statusCodeOfWeather = jsonDecode(weatherData)['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(statusCodeOfWeather);
      weatherMessage = weatherModel.getMessage(temprature);
      print(temprature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {                      
                      dynamic weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                     var typedName = Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      },));
                      if (typedName == '') {
                        print('Enter proper city Name');
                      }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

      // var temprature = jsonDecode(weatherData)['main']['temp'];
      // var cityName = jsonDecode(weatherData)['name'];
      // var statusCodeOfWeather = jsonDecode(weatherData)['weather'][0]['id'];