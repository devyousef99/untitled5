import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/event_page.dart';
import 'package:untitled5/product.dart';
import 'HTTP/http_service.dart';
import 'HTTP/list_user_response.dart';
import 'HTTP/user.dart';

class landing_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: landing(),
    );
  }
}
class landing extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<landing> {
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
                    DropdownButton(
                      dropdownColor: Colors.transparent,
                      hint: const Text("وش جوك ؟",style:  TextStyle(
                          color: Colors.white
                      )),
                      value: ValueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          ValueChoose = newValue;
                        });
                        //   // switch(newValue){
                        //   //   case "وناسة" :
                        //   //     Navigator.push(
                        //   //       context,
                        //   //       MaterialPageRoute(builder: (context) => map_page()),
                        //   //     );
                        //   //     break;
                        //   //   case "دندنة" :
                        //   //     Navigator.push(
                        //   //       context,
                        //   //       MaterialPageRoute(builder: (context) => map_page()),
                        //   //     );
                        //   //     break;
                        //   //   case "تصوير" :
                        //   //     Navigator.push(
                        //   //       context,
                        //   //       MaterialPageRoute(builder: (context) => map_page()),
                        //   //     );
                        //   //     break;
                        //   //   case "روقان" :
                        //   //     Navigator.push(
                        //   //       context,
                        //   //       MaterialPageRoute(builder: (context) => map_page()),
                        //   //     );
                        //   //     break;
                        //   //   case "عشوة" :
                        //   //     Navigator.push(
                        //   //       context,
                        //   //       MaterialPageRoute(builder: (context) => map_page()),
                        //   //     );
                        //   //     break;
                        //   //   case "هشك بسك" :
                        //   //     Navigator.push(
                        //   //       context,
                        //   //       MaterialPageRoute(builder: (context) => map_page()),
                        //   //     );
                        //   //     break;
                        // }
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem,style: const TextStyle(
                              color: Colors.white
                          ),),
                        );
                      }).toList(),
                    ),
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

  Widget makeItem(String image, tag ,String name) {
    return Hero(
      tag: tag,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>
                  event()));
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