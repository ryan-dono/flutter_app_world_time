

import 'package:flutter/material.dart';
import 'package:flutter_app_login/landing.dart';
import 'package:flutter_app_login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {

  runApp(MaterialApp(
    initialRoute: '/', //later when we done /loading will be default
    routes: {
      '/': (context) => LoginPage(),
    },
  ));
}


