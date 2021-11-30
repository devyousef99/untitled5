import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/register.dart';

///Sign up page
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signup(),
    );
  }
}

class Signup extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<Signup> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        ///transparent is used to show the origin of the background
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          ///this is key is used in Form to validate the input users
          key: formkey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Sign up mdl.png'), fit: BoxFit.fill),
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
                              /// this is the small white box inside the widget
                              /// that shows all text fields and button
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
                                    children:  <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 30.0,
                                            bottom: 20.0,
                                            left: 25.0,
                                            right: 25.0),
                                        child: TextFormField(
                                          validator: validateEmail,
                                          keyboardType:
                                          TextInputType.emailAddress,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            icon: Icon(
                                              FontAwesomeIcons.at,
                                              color: Colors.black,
                                              size: 22.0,
                                            ),
                                            hintText: 'Email Address',
                                            hintStyle: TextStyle(fontSize: 17.0,
                                            fontFamily: 'koliko',
                                            letterSpacing: 2),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              /// designed button
                              Container(
                                margin: const EdgeInsets.only(top: 140.0),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                                    color: Colors.black),
                                child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: () {
                                    _validateInput();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 40.0),
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontFamily: 'koliko',
                                      letterSpacing: 2),
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
      ),
    );
  }
  ///To validate all input when button clicked!
  void _validateInput() {
    //If all data are correct then save data to out variables
    if (formkey.currentState.validate()) {
      _showDialog(context);
      print("Your Data Saved");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return register();
        }),
      );
      //If all data are not valid then start auto validation.
    } else {
      print("Please Check Your Data");
    }
  }
  ///To check the input mail
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Please Check Your Mail';
    else
      return null;
  }
  ///designed dialog to show t text after button clicked!
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
}
