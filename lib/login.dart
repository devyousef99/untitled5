import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled5/register.dart';
import 'package:untitled5/translations/locale_keys.g.dart';

import 'home_page.dart';
import 'landing.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'تسجيل دخول',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
//           leading: IconButton(
//             onPressed: (){
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.door_back_door),
//             color: Colors.white,
//           ),
//           backgroundColor: Colors.transparent,
//           title: const Text('تسجيل دخول'),
            ),
        body: Login(),
      ),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(LocaleKeys.login_page.tr()),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/Log in mdl.png'), fit: BoxFit.fill),
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
                                  height: 250.0,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 26.0,
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
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              icon: const Icon(
                                                FontAwesomeIcons.at,
                                                color: Colors.black,
                                                size: 22.0,
                                              ),
                                              hintText:
                                                  LocaleKeys.Email_Address.tr(),
                                              hintStyle: TextStyle(
                                                  fontSize: 17.0,
                                                  fontFamily: 'koliko',
                                                  color: Colors.grey.shade700,
                                                  letterSpacing: 2),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 250.0,
                                          height: 1.0,
                                          color: Colors.grey[400],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10.0,
                                              bottom: 20.0,
                                              left: 25.0,
                                              right: 25.0),
                                          child: TextFormField(
                                            validator: validateMobile,
                                            obscureText: true,
                                            style: const TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              icon: const Icon(
                                                FontAwesomeIcons.lock,
                                                size: 22.0,
                                                color: Colors.black,
                                              ),
                                              hintText:
                                                  LocaleKeys.Password.tr(),
                                              hintStyle: TextStyle(
                                                  fontSize: 17.0,
                                                  fontFamily: 'koliko',
                                                  color: Colors.grey.shade700,
                                                  letterSpacing: 2),
                                            ),
                                            textInputAction: TextInputAction.go,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 230.0),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    color: Colors.black),
                                child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  onPressed: _validateInput,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 40.0),
                                    child: Text(
                                      LocaleKeys.login_page.tr(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          letterSpacing: 3,
                                          fontFamily: 'koliko'),
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
                              child: Text(
                                LocaleKeys.forget_password_button.tr(),
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.grey.shade700,
                                    letterSpacing: 1.5,
                                    fontSize: 15.0,
                                    fontFamily: 'koliko'),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return RegisterPage();
                                }),
                              );
                            },
                            child: Text(
                              LocaleKeys.createAccount_loginPage.tr(),
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade700,
                                  letterSpacing: 1.5,
                                  fontSize: 15.0,
                                  fontFamily: 'koliko'),
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
    } else {
      SnackBar(content: Text('data'));
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'يرجى إدخال بريد الكتروني صحيح';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length != 10)
      return 'يرجى إدخال رقم جوال صحيح';
    else
      return null;
  }
}
