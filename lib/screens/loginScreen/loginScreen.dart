import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
//import 'package:my_quiz/screens/home/info.dart';
import 'package:quizi_quiz/services/auth.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthService _auth = AuthService();

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      dynamic result = await _auth.signInWithEmailAndPassword(data.name, data.password);
      if (result == null) {
        return 'No match';
      }
      else{
        return null;
      }
    });
  }

  Future<String> _registerUser(LoginData data) {
    return Future.delayed(loginTime).then((_) async {
      dynamic result = await _auth.registerWithEmailAndPassword(data.name, data.password);
      if (result == null) {
        return 'Error try registering with different mail';
      }
      else{
        return null;
      }
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) async {
      dynamic result = await _auth.sendPasswordResetEmail(name);
      if (result == null) {
        return 'User does not exist';
      }
      else{
        return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Quizi Quiz',
      onLogin: _authUser,
      onSignup: _registerUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
                     builder: (context) => Container()
                  ));

      },
      onRecoverPassword: _recoverPassword,
    );
  }
}