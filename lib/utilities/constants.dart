import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
const kTextFeildInputDecoration = InputDecoration(
  hintText: 'Enter The City Name',
  prefixIcon: Icon(
    Icons.location_city_outlined,
    color: Colors.black,
  ),
  labelStyle: TextStyle(color: Colors.black),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  filled: true,
  fillColor: Colors.white,
);

const getWeatherButtonDecoration = BoxDecoration(
  color: Colors.blueGrey,
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);
