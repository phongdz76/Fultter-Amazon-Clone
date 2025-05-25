import 'package:amazone/constants/global_variables.dart';
import 'package:flutter/material.dart';

enum Auth {
  signUp,
  signIn,
}

class AuthScreen extends StatefulWidget{
  static const String routeName = '/auth screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>{
  Auth _auth = Auth.signUp;
  @override
   Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('Welcome', 
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            ListTile(
              title: const Text('Create Account', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signUp,
                groupValue: _auth, 
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            ),

             ListTile(
              title: const Text('Sign-In', 
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              ),
              leading: Radio(
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signIn,
                groupValue: _auth, 
                onChanged: (Auth? value) {
                  setState(() {
                    _auth = value!;
                  });
                },
              ),
            )

          ],
          ),
        )
      ),
    );
  }
}