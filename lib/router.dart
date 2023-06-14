import 'package:a_s_c/constants/features/auth/screens/auth_screen.dart';
import 'package:a_s_c/constants/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const AuthScreen());
    case HomeScreen.routeName:
          return MaterialPageRoute(builder: (context) => const HomeScreen());

    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text("Screen doesn't exist!\n 404"),
          ),
        ),
      );
  }
}
