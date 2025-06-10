import 'dart:convert';
import 'package:amazone/constants/error_handling.dart';
import 'package:amazone/constants/global_variables.dart';
import 'package:amazone/constants/utils.dart';
import 'package:amazone/features/home/screens/home_screen.dart';
import 'package:amazone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amazone/providers/user_providers.dart';

class AuthServices {

  // Sign up user
  void signUpUser({
    required BuildContext context, // Added BuildContext parameter
    required String name,
    required String email,
    required String password,
  }) 
  async{
    try{
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );  
    
      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context, // Replace with actual BuildContext if needed
        onSuccess: () {
          showSnackBar(
            context,
            'Account created ! Login with the same credentials',
          );
        },
      );

    }    
    catch (e) {
      showSnackBar(context, e.toString());
    }
  }  

  // Sign in user
  void signInUser({
    required BuildContext context, // Added BuildContext parameter
    required String email,
    required String password,
  }) 
  async{
    try{
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
      httpErrorHandle(
        response: res,
        context: context, // Replace with actual BuildContext if needed
        onSuccess: () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false).setUser(res.body);
          await prefs.setString('x-auth-token', jsonDecode(res.body)['token']); 
          Navigator.pushNamedAndRemoveUntil(
            context, 
            HomeScreens.routeName, 
            (route) => false,
          );
        },
      );

    }    
    catch (e) {
      showSnackBar(context, e.toString());
    }
  }  
}
