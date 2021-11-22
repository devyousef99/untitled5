import 'package:flutter/material.dart';
import 'package:untitled5/register.dart';
import 'package:untitled5/sign_up.dart';
import 'package:untitled5/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}


