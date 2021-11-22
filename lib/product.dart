
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/plan.dart';

import 'HTTP/http_service.dart';
import 'HTTP/list_user_response.dart';
import 'HTTP/user.dart';



class Products extends StatefulWidget {
  final String image;
  const Products({ Key key, this.image}) : super(key: key);

  @override
  _ShoesState createState() => _ShoesState();
}

class _ShoesState extends State<Products> {
  bool isLoading = false;
  HttpService http;
  ListUserResponse listUserResponse;
  List<User> users;

  @override
  void initState() {
    http = HttpService();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final String _data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
          child: Hero(
        tag: 'red',
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(widget.image), fit: BoxFit.cover),
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 10))
              ]),

          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                plan(),
                                settings: RouteSettings(
                                  arguments: _data,
                                )
                            ));
                      },
                      child: Container(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 500,
                child:
                Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.9),
                            Colors.black.withOpacity(.0),
                          ])),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                               Center(
                                child:
                                // users != null
                                  Text(
                                  _data,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                          const SizedBox(
                            height: 25,
                          ),
                           Text(
                                _data,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  plan(),
                                                  settings: RouteSettings(
                                                    arguments: _data,
                                                  )
                                              ));
                                        },
                                        child: const Text(
                                          'Add to my Plan',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ))),
                              ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
              )
            ],
          ),
        ),
      )),
    );
  }
}