import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Signup extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/sign up.png'), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: Container(
                    padding: const EdgeInsets.only(top: 23.0),
                    child: Column(
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Card(
                              elevation: 5.0,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                width: 300.0,
                                height: 125.0,
                                child: Column(
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 30.0,
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
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 120.0),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(40.0)),
                                  color: Colors.black),
                              child: MaterialButton(
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  _showDialog(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 40.0),
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontFamily: 'WorkSansBold'),
                                  ),
                                ),
                              ),
                            ),
                          ],
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

void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Check your email"),
        content: const Text("To confirm your email address."),
        actions: <Widget>[
          RaisedButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Signup();
                  },
                ),
              );
            },
          ),
        ],
      );
    },
  );
}
