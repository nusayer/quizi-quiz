import 'package:flutter/material.dart';
//import 'package:my_quiz/screens/home/category.dart';
//import 'package:my_quiz/screens/home/info.dart';
import 'package:provider/provider.dart';
//import 'package:my_quiz/screens/loginScreen/loginScreen.dart';
import 'package:quizi_quiz/models/user.dart';
import 'package:quizi_quiz/screens/loginScreen/loginScreen.dart';




class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // return either the Home or LoginScreen Widget
    if (user == null){
      return LoginScreen();
    } else {
      return Container();
    }
    
  }
}