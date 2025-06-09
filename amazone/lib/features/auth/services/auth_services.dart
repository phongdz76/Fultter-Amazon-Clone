import 'package:amazone/models/user.dart';

class AuthServices {
  void signUpUser({
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
        type: '',
        token: '',
      );  
    }
    catch (e)
    {
      print("Error signing up user: $e");
    }
  }
}
