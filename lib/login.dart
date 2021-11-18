import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.png'), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 270.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.topCenter,
                          children: <Widget>[
                            Card(
                              elevation: 5.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                width: 300.0,
                                height: 190.0,
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                          left: 25.0,
                                          right: 25.0),
                                      child: TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.at,
                                            color: Colors.black,
                                            size: 22.0,
                                          ),
                                          hintText: 'Email Address',
                                          hintStyle: TextStyle(fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      height: 1.0,
                                      color: Colors.grey[400],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 20.0,
                                          bottom: 20.0,
                                          left: 25.0,
                                          right: 25.0),
                                      child: TextField(
                                        obscureText: true,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          icon: Icon(
                                            FontAwesomeIcons.lock,
                                            size: 22.0,
                                            color: Colors.black,
                                          ),
                                          hintText: 'Password',
                                          hintStyle: TextStyle(fontSize: 17.0),
                                        ),
                                        textInputAction: TextInputAction.go,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 170.0),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.0)),
                                  color: Colors.black),
                              child: MaterialButton(
                                highlightColor: Colors.transparent,
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 40.0),
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        letterSpacing: 3,
                                        fontFamily: 'WorkSansBold'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  letterSpacing: 1,
                                  fontSize: 15.0,
                                  fontFamily: 'WorkSansMedium'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

