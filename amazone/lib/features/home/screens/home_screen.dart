import "package:amazone/providers/user_providers.dart";
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      body: Center(
        child: Text(
          user.toJson(),
        ),
      ),
    );
  }
}