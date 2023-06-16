import 'package:a_s_c/common/widgets/bottom_bar.dart';
import 'package:a_s_c/features/admin/screens/add_product_screen.dart';
import 'package:a_s_c/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (context) => const AuthScreen());
    case BottomBar.routeName:
          return MaterialPageRoute(builder: (context) => const BottomBar());
    case AddProductScreen.routeName:
          return MaterialPageRoute(builder: (context) => const AddProductScreen());      
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
