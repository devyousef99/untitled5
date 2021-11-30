import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/home_page.dart';
import 'package:untitled5/translations/locale_keys.g.dart';
import 'HTTP/http_service.dart';
import 'HTTP/list_user_response.dart';
import 'HTTP/user.dart';
import 'artist_page.dart';
import 'package:easy_localization/src/public_ext.dart';
///Events Page
class Events extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ///this three lines are for language of the app
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Events',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        ),
        body: event(),
      ),
    );
  }
}

class Category {
  String name, image;
  Category({this.name, this.image});
}
///Custom list to show the data.
class artistsData {
  final List<Category> _myList = <Category>[
    Category(name: 'event1', image: 'assets/log_in.png'),
    Category(name: 'event2', image: 'assets/log_in.png'),
    Category(name: 'event3', image: 'assets/log_in.png'),
    Category(name: 'event4', image: 'assets/log_in.png'),
    Category(name: 'event5', image: 'assets/log_in.png'),
  ];
  List<Category> get myList => _myList;
}

class event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}

class _EventState extends State<event> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String ValueChoose;
  List listItem = ["هشك بشك", "عشوة", "روقان", "تصوير", "دندنة", "وناسة"];
  bool CheckBoxValue = false;
  bool isLoading = false;
  ///API connection.
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
    List<Category> _artistsList = artistsData().myList;
    ///to control the arrow back when clicked!
    return WillPopScope(
      onWillPop: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => home()),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
          LocaleKeys.Events_page.tr(),
            style: const TextStyle(fontSize: 26, fontFamily: 'koliko'),
          ),
        ),
        body: Container(
          color: Colors.black,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 5.0),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final event = _artistsList[index];
                      // const SizedBox(width: 10.0);
                      // const Padding(
                      //     padding: EdgeInsets.all(8.0));
                      return makeItem(
                          // title: Text(user.firstName),
                          // leading: Image.network(user.avatar),
                          // subtitle: Text(user.email),
                          "assets/events.jpeg",
                          event.name,
                          event.name);
                    },
                    itemCount: _artistsList.length,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  ///this is the design created to show a list of data.!
  Widget makeItem(String image, tag, String name) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => artist()),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              boxShadow: const [
                BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 10,
                    offset: Offset(0, 10))
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
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 0.0, top: 100, right: 0.0, bottom: 0.0),
                          child: Center(
                            child: Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'koliko',
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
