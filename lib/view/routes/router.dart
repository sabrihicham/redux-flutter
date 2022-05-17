import 'package:flutter/material.dart';
import 'package:incredux/view/screen/home.dart';
import 'package:incredux/view/screen/screen1.dart';
import 'package:incredux/view/screen/screen2.dart';
import 'package:incredux/constants/strings.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const Home());
      case screen1:
        return MaterialPageRoute(builder: (context) => const Screen1());
      case screen2: 
        return MaterialPageRoute(builder: (context) => const Screen2());
    }
  }
}
