import 'package:flutter/material.dart';
import 'package:quizi_quiz/screens/wrapper.dart';
//import 'package:my_quiz/screens/wrapper.dart';
import 'package:quizi_quiz/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:quizi_quiz/models/user.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  } 
}
