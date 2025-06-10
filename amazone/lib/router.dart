import 'package:amazone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:amazone/features/home/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting){
  switch(routeSetting.name) {
     case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => const AuthScreen(),
        );

    case HomeScreens.routeName:
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => const HomeScreens(),
      );
      
    default:
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => const Scaffold(
         body: Center(
          child: Text("Screen does not exist!"),
        ),
      ),
    );
  }
}