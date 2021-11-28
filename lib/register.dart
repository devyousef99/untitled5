import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/profile.dart';
import 'home_page.dart';
import 'landing.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Create Account'),
        elevation: 0.0,
      ),
      body: register(),
    );
  }
}

class register extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<register> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  int _value = 1;
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980, 1),
      lastDate: DateTime.now(),
      errorFormatText: 'Please enter a valid date',
      errorInvalidText: 'Please enter a valid date',
      builder: (BuildContext context, Widget child) {
        return Theme(
            data: ThemeData.dark()
                .copyWith(dialogBackgroundColor: Colors.black87),
            child: child);
      },
    );

    DateTime endDate = DateTime(2007);
    if (picked != selectedDate && picked.isBefore(endDate)) {
      setState(
        () {
          selectedDate = picked;
          return print('test');
        },
      );
    } else {
      final snackBar = SnackBar(
        content: const Text('Sorry!, you must be 15 years old or over'),
        action: SnackBarAction(label: 'Undo', onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: formkey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Profile mdl.png'),
                  fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 130.0),
                    child: Container(
                      padding: const EdgeInsets.only(top: 20.0),
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
                                  height: 565.0,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 40.0,
                                              right: 25.0),
                                          child: TextFormField(
                                            validator: validateName,
                                            keyboardType: TextInputType.name,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: const Text('First Name'),
                                              labelStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'koliko',
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          height: 1.0,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 40.0,
                                              right: 25.0),
                                          child: TextFormField(
                                            validator: validateName,
                                            keyboardType: TextInputType.name,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: const Text('Last Name'),
                                              labelStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'koliko',
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          height: 1.0,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 40.0,
                                              right: 25.0),
                                          child: TextFormField(
                                            validator: validateMobile,
                                            keyboardType: TextInputType.phone,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: const Text('Phone Number'),
                                              labelStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'koliko',
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          height: 1.0,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 1.0,
                                              bottom: 1.0,
                                              left: 40.0,
                                              right: 25.0),
                                          child: TextFormField(
                                            validator: validateEmail,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label:
                                                  const Text('Email Address'),
                                              labelStyle: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'koliko',
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          height: 1.0,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 10.0,
                                              left: 10.0,
                                              right: 25.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Radio(
                                                value: 1,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      _value = value;
                                                    },
                                                  );
                                                },
                                              ),
                                              Text(
                                                'Male',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.grey.shade700,
                                                    fontFamily: 'koliko',
                                                    letterSpacing: 2),
                                              ),
                                              Radio(
                                                value: 2,
                                                groupValue: _value,
                                                onChanged: (value) {
                                                  setState(
                                                    () {
                                                      _value = value;
                                                    },
                                                  );
                                                },
                                              ),
                                              Text(
                                                'Female',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.grey.shade700,
                                                    fontFamily: 'koliko',
                                                    letterSpacing: 2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          height: 1.0,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 15.0,
                                            bottom: 10.0,
                                            left: 23.0,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Date Of Birthday: ',
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'koliko',
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 5.0, left: 10),
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(40.0),
                                                    ),
                                                    color: Colors.black),
                                                child: MaterialButton(
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onPressed: () =>
                                                      _selectDate(context),
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 3.0,
                                                            horizontal: 3.0),
                                                    child: Text(
                                                      'Select date',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15.0,
                                                          letterSpacing: 2.0,
                                                          fontFamily: 'koliko'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "${selectedDate.toLocal()}"
                                              .split(' ')[0],
                                          style: TextStyle(
                                            color: Colors.grey.shade700,
                                            fontSize: 16.0,
                                            fontFamily: 'koliko',
                                            letterSpacing: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 545.0),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    color: Colors.black),
                                child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: _validateInput,
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      'Save',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 2,
                                          fontFamily: 'koliko'),
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

  void _validateInput() {
    //If all data are correct then save data to out variables
    if (formkey.currentState.validate()) {
      print("Your Data Saved");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return home();
        }),
      );
      //If all data are not valid then start auto validation.
    }
    // else {
   // SnackBar(content: Text('data'));
   //  }
  }

  String validateMobile(String value) {
    if (value.length != 10) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }

  String validateName(String value) {
    if (value.length < 3) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address';
    } else {
      return null;
    }
  }
}
