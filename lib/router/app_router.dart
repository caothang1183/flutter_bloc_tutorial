import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/setting_screen.dart';
import 'package:flutter_bloc_tutorial/presentation/screens/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(
            title: "Home Screen",
            color: Colors.blueAccent,
          ),
        );
        break;

      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: "2nd Screen",
            color: Colors.greenAccent,
          ),
        );
        break;

      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: "3rd Screen",
            color: Colors.redAccent,
          ),
        );
        break;

      case '/setting':
        return MaterialPageRoute(
          builder: (_) => SettingScreen(
            title: "Setting",
            color: Colors.blueAccent,
          ),
        );
        break;

      default:
        return null;
    }
  }
}
