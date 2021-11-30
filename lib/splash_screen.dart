import 'dart:async';
import 'package:flutter/material.dart';
import 'home_page.dart';
///This page is only for the splash Screen
class SplachScreenPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  /// The time of the screen will show
  startTimer() async {
    var duration =  const Duration(seconds: 5);
    return Timer(duration, route);
  }
  /// After the splash screen is finish what will happen
  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => home()));
  }
  ///Control the design of the splash screen
  initScreen(BuildContext context){
    return Scaffold(
      body: Center(
        child: Image.asset("assets/splash_screen.png",
        fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
    );
  }

}
