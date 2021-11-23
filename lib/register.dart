import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'landing.dart';


class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('أنشاء حساب'),
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
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(2006, 1),
        firstDate: DateTime(1980, 1),
        lastDate: DateTime(2007),
        builder: (BuildContext context, Widget child) {
          return Theme(
              data: ThemeData.dark()
                  .copyWith(dialogBackgroundColor: Colors.black87),
              child: child);
        });
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List gender = ["Male", "Female"];
  String userGender;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Form(
              key: formkey,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/profile.png'), fit: BoxFit.fill),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 170.0),
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
                                      height: 500.0,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 40.0,
                                                  right: 25.0),
                                              child: TextFormField(
                                                validator: validateName,
                                                keyboardType: TextInputType.name,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  label:Text ('First Name'),
                                                  labelStyle: TextStyle(fontSize: 15.0),
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
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 40.0,
                                                  right: 25.0),
                                              child: TextFormField(
                                                validator: validateName,
                                                keyboardType: TextInputType.name,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  label:Text ('Last Name'),
                                                  labelStyle: TextStyle(fontSize: 15.0),
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
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 40.0,
                                                  right: 25.0),
                                              child: TextFormField(
                                                validator: validateMobile,
                                                keyboardType: TextInputType.phone,
                                                style: const TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black),
                                                decoration: const InputDecoration(
                                                  border: InputBorder.none,
                                                  label:Text ('Phone Number'),
                                                  labelStyle: TextStyle(fontSize: 15.0),
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
                                                  top: 5.0,
                                                  bottom: 5.0,
                                                  left: 40.0,
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
                                                  label: Text('Email Address'),
                                                  labelStyle: TextStyle(fontSize: 15.0),
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
                                                  left: 40.0,
                                                  right: 25.0),
                                              child: Row(
                                                children: <Widget>[
                                                  selectGender(0, 'Male'),
                                                  selectGender(1, 'Female'),
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
                                                top: 20.0,
                                                bottom: 10.0,
                                                left: 23.0,
                                              ),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Date Of Birthday: ',
                                                    style: TextStyle(
                                                        fontSize: 16.0,
                                                        color: Colors.grey.shade800),
                                                  ),
                                                  Container(
                                                    margin: const EdgeInsets.only(
                                                        top: 5.0, left: 20),
                                                    decoration: const BoxDecoration(
                                                        borderRadius: BorderRadius.all(
                                                            Radius.circular(40.0)),
                                                        color: Colors.black),
                                                    child: MaterialButton(
                                                      highlightColor:
                                                      Colors.transparent,
                                                      onPressed: () =>
                                                          _selectDate(context),
                                                      child: const Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            vertical: 3.0,
                                                            horizontal: 3.0),
                                                        child: Text(
                                                          'Select date',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.0,
                                                              fontFamily:
                                                              'WorkSansBold'),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text("${selectedDate.toLocal()}"
                                                .split(' ')[0]),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 510.0),
                                    decoration: const BoxDecoration(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                        color: Colors.black),
                                    child: MaterialButton(
                                      highlightColor: Colors.transparent,
                                      onPressed: _validateInput,
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 40.0),
                                        child: Text(
                                          'SAVE',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25.0,
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
              )),

        ),

    );
  }
  Row selectGender(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          value: gender[btnValue],
          groupValue: userGender,
          onChanged: (value) {
            setState(() {
              userGender = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
  void _validateInput() {
    //If all data are correct then save data to out variables
    if (formkey.currentState.validate()) {
      print("Your Data Saved");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return landing();
        }),
      );
      //If all data are not valid then start auto validation.
    } else{
      SnackBar(content: Text('data'));
    }
  }

  String validateMobile(String value) {
    if (value.length != 10)
      return 'يرجى إدخال رقم جوال صحيح';
    else
      return null;
  }

  String validateName(String value) {
    if (value.length < 3)
      return 'الرجاء ادخال الاسم';
    else
      return null;
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
}
