import 'dart:ui';
import 'package:dio/dio.dart';
import '../../translations/locale_keys.g.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/translations/locale_keys.g.dart';
import '../HTTP/http_service.dart';
import '../HTTP/list_user_response.dart';
import '../HTTP/user.dart';
import 'event_page.dart';
import 'map_page.dart';
// This page will show after splash Screen is finish.
class landing extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<landing> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String ValueChoose;
  //list of translation items.
  List listItem = [
    LocaleKeys.mingle_landing.tr(),
    LocaleKeys.Listen_landing.tr(),
    LocaleKeys.PhotoSpots_landing.tr(),
    LocaleKeys.Chill_landing.tr(),
    LocaleKeys.Eat_landing.tr(),
    LocaleKeys.Dance_landing.tr(),
  ];
  bool CheckBoxValue = false;
  bool isLoading = false;
  //API Connection.
  HttpService http;
  ListUserResponse listUserResponse;
  List<User> users;
  Future getListUser() async {
    Response response;
    try {
      isLoading = true;
      response = await http.getRequest("/api/users?page=2");
      isLoading = false;
      if (response.statusCode == 200) {
        setState(() {
          listUserResponse = ListUserResponse.fromJson(response.data);
          users = listUserResponse.users;
        });
      } else {
        print("There is some problem status code not 200");
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    http = HttpService();
    getListUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/update homepage.png"),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 170.0),
            child: Column(
              children: [
                DropdownButton(
                  dropdownColor: Colors.transparent,
                  hint: Text(
                    LocaleKeys.dropDownButton_landing.tr(),
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontFamily: 'koliko'),
                  ),
                  value: ValueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      ValueChoose = newValue;
                    });
                    switch (newValue) {
                      case "Mingle":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => map_page()),
                        );
                        break;
                      case "Listen":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => map_page()),
                        );
                        break;
                      case "Photo Spots":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => map_page()),
                        );
                        break;
                      case "Chill":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => map_page()),
                        );
                        break;
                      case "Eat":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => map_page()),
                        );
                        break;
                      case "Dance":
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => map_page()),
                        );
                        break;
                    }
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(
                        valueItem,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
                MediaQuery.removePadding(
                  removeTop: true,
                  context: context,
                  child: users != null
                      ? ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            //const SizedBox(width: 10.0);
                            // const Padding(
                            return makeItem(
                              "assets/events.jpeg",
                              user.firstName,
                              user.lastName,
                              user.firstName,
                            );
                          },
                          itemCount: users.length,
                        )
                      : const Center(
                          child: Text(
                            "No Data",
                            style: TextStyle(color: Colors.white),
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
  //this is the design created to show a list of data.!
  Widget makeItem(String image, tag, String name, String _name) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => event()));
        },
        child: Container(
          height: 180,
          // width: double.infinity,
          padding: EdgeInsets.all(1),
          margin: const EdgeInsets.only(
              bottom: 5.0, right: 10.0, left: 10.0, top: 5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
              DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              boxShadow: const [
                BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 10,
                    offset: Offset(0, 5))
              ]),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, top: 50, right: 0.0, bottom: 0.0),
                          child: Center(
                              child: Column(
                                children: [
                                  Text(
                                    name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    _name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
