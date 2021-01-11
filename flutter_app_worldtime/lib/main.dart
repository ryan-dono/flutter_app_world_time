
import 'package:flutter/material.dart';
import 'package:flutter_app_worldtime/pages/home.dart';
import 'package:flutter_app_worldtime/pages/choose_location.dart';
import 'package:flutter_app_worldtime/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/', //later when we done /loading will be default
    routes: {
      '/':(context) => Loading(),
      '/home':(context) => Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ));
}



