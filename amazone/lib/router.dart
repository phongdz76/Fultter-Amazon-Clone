import 'package:amazone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting){
  switch(routeSetting.name) {
     case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSetting,
        builder: (_) => const AuthScreen(),
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