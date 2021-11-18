import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/product.dart';
import 'HTTP/http_service.dart';
import 'HTTP/list_user_response.dart';
import 'HTTP/user.dart';

class event_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: event(),
    );
  }
}
class event extends StatefulWidget {
  @override
  _EventState createState() => _EventState();
}
class _EventState extends State<event> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String ValueChoose;
  List listItem = ["هشك بشك", "عشوة", "روقان","تصوير","دندنة","وناسة"];
  bool CheckBoxValue = false;
  bool isLoading = false;
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/home_page.png"),
                    fit: BoxFit.cover,
                  )
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 0.0 , top: 150.0 , right: 0.0 , bottom: 0.0)
                ,
                child: Column(
                  children: [
                    users !=null
                        ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        // const SizedBox(width: 10.0);
                        // const Padding(
                        //     padding: EdgeInsets.all(8.0));
                        return makeItem(
                          // title: Text(user.firstName),
                          // leading: Image.network(user.avatar),
                          // subtitle: Text(user.email),
                            "assets/events.jpeg",
                            user.firstName,
                            user.firstName
                        );
                      },
                      itemCount: users.length,
                    )
                        : const Center(
                      child: Text("No Data", style: TextStyle(
                          color: Colors.white
                      ),),
                    )
                  ],
                ),
              ),
            ),
          ),

        ));
  }

  final List<Color> kMixedColors = [
    Color(0xff71A5D7),
    Color(0xff72CCD4),
    Color(0xffFBAB57),
    Color(0xffF8B993),
    Color(0xff962D17),
    Color(0xffc657fb),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(image: "assets/events.jpeg", name: "Beef"),
    Category(image: "assets/events.jpeg", name: "Chicken"),
    Category(image: "assets/events.jpeg", name: "Dessert"),
    Category(image: "assets/events.jpeg", name: "Lamb"),
    Category(image: "assets/events.jpeg", name: "Pasta"),
  ];
  Widget makeItem(String image, tag ,String name) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  Products(image: image, key: null,)));
        },
        child: Container(
          //height: 180,
          // width: double.infinity,
          padding: EdgeInsets.all(20),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill
              ),
              boxShadow: const [
                BoxShadow(
                    color: Colors.transparent,
                    blurRadius: 10,
                    offset: Offset(0, 10)
                )
              ]
          ),
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
                          padding: const EdgeInsets.only(left: 0.0,top: 100,right: 0.0,bottom: 0.0),
                          child: Center(
                            child:
                            Text(
                              name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
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
class Category {
  final String image;
  final String name;

  Category({@required this.image, @required this.name});
}