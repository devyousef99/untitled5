import 'dart:ui';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/profile.dart';
import 'package:untitled5/translations/locale_keys.g.dart';
import 'home_page.dart';
//Registeration page
class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(LocaleKeys.createAccount_loginPage.tr()),
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
  //Date & Calender
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980, 1),
      lastDate: DateTime.now(),
      errorFormatText: LocaleKeys.errorFormatText_profile.tr(),
      errorInvalidText: LocaleKeys.errorInvalidText_profile.tr(),
      builder: (BuildContext context, Widget child) {
        return Theme(
            data: ThemeData.dark()
                .copyWith(dialogBackgroundColor: Colors.black87),
            child: child);
      },
    );
    //Validation for calender
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
        content: Text(LocaleKeys.snackBar_message_profile.tr()),
        action: SnackBarAction(
            label: LocaleKeys.content_AlertDialog_signup.tr(),
            onPressed: () {}),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //this three lines are for language of the app
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          //this is key is used in Form to validate the input users.
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
                                // this is the small white box inside the widget
                                // that shows all text fields and button.
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
                                            //Name_Field
                                            validator: validateName,
                                            keyboardType: TextInputType.name,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: Text(
                                                LocaleKeys.First_Name.tr(),
                                              ),
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
                                            //Last_Name Field
                                            validator: validateName,
                                            keyboardType: TextInputType.name,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: Text(
                                                LocaleKeys.Last_Name.tr(),
                                              ),
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
                                            //Mobile Field
                                            validator: validateMobile,
                                            keyboardType: TextInputType.phone,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: Text(
                                                LocaleKeys.Phone_Number.tr(),
                                              ),
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
                                            //Mail Field
                                            validator: validateEmail,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              label: Text(
                                                LocaleKeys.Email_Address.tr(),
                                              ),
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
                                          //Radio button
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
                                                LocaleKeys.Male.tr(),
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
                                                LocaleKeys.Female.tr(),
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
                                        //Here is where the calender is show
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 15.0,
                                              bottom: 10.0,
                                              left: 46.0,
                                              right: 30.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                LocaleKeys.Date_Of_Birthday
                                                    .tr(),
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.grey.shade700,
                                                  fontFamily: 'koliko',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 5.0, left: 7),
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40.0),
                                              ),
                                              color: Colors.black),
                                          child: MaterialButton(
                                            highlightColor: Colors.transparent,
                                            onPressed: () =>
                                                _selectDate(context),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 3.0,
                                                      horizontal: 3.0),
                                              child: Text(
                                                LocaleKeys.Select_date_Button
                                                    .tr(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15.0,
                                                    letterSpacing: 2.0,
                                                    fontFamily: 'koliko'),
                                              ),
                                            ),
                                          ),
                                        ),
                                        //After Calender is set it will show here.
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10.5),
                                          child: Text(
                                            "${selectedDate.toLocal()}"
                                                .split(' ')[0],
                                            style: TextStyle(
                                              color: Colors.grey.shade700,
                                              fontSize: 16.0,
                                              fontFamily: 'koliko',
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //Designed Button
                              Container(
                                margin: const EdgeInsets.only(top: 545.0),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    color: Colors.black),
                                child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: _validateInput,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      LocaleKeys.Save_Button.tr(),
                                      style: const TextStyle(
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
  //To validate all input when button clicked!
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
  }
  //To validate Mobile.
  String validateMobile(String value) {
    if (value.length != 10) {
      return 'Please enter a valid phone number';
    } else {
      return null;
    }
  }
  //To validate Name.
  String validateName(String value) {
    if (value.length < 3) {
      return 'Please enter your name';
    } else {
      return null;
    }
  }
  //To validate Mail.
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
