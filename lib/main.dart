import 'package:flutter/material.dart';
import 'package:flutter_world_time_app/pages/home.dart';
import 'package:flutter_world_time_app/pages/loading.dart';
import 'package:flutter_world_time_app/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
//    initialRoute: Home.routeName,
    initialRoute: '/loading',
//    home: Loading(),
    routes: {
//      '/': (context) => Home(),
      Home.routeName: (context) => Home(),
      '/loading': (context) => Loading(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
