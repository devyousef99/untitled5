import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profile> {
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
    return Scaffold(
      body: SingleChildScrollView(
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
                                child: Column(
                                  children: <Widget>[
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 40.0,
                                          right: 25.0),
                                      child: TextField(
                                        keyboardType: TextInputType.name,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
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
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 40.0,
                                          right: 25.0),
                                      child: TextField(
                                        keyboardType: TextInputType.name,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
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
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 40.0,
                                          right: 25.0),
                                      child: TextField(
                                        keyboardType: TextInputType.phone,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
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
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.0,
                                          bottom: 5.0,
                                          left: 40.0,
                                          right: 25.0),
                                      child: TextField(
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black),
                                        decoration: InputDecoration(
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
                                        left: 26.0,
                                        right: 5.0
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
                            Container(
                              margin: const EdgeInsets.only(top: 478.0),
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
        ),
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
}
