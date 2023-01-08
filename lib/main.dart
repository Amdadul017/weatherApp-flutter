import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_weatherapp/Screens/weather_screen.dart';
import 'package:flutter_application_weatherapp/Screens/device_api_screen.dart';
import 'package:flutter_application_weatherapp/Screens/todo_screen.dart';

import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    title: "Weather App",
    initialRoute: '/main',
    routes: {
      '/main': ((context) => const MainScreen()),
      '/deviceapi': ((context) => const DeviceApiScreen()),
      '/todolist': ((context) => const ForecastScreen()),
    },
  ));
}
