import 'package:amazone/constants/error_handling.dart';
import 'package:amazone/constants/global_variables.dart';
import 'package:amazone/constants/utils.dart';
import 'package:amazone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthServices {
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
}
