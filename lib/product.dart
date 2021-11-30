import 'package:flutter/material.dart';
import 'package:untitled5/artist_page.dart';
import 'package:untitled5/plan.dart';
import 'HTTP/http_service.dart';
import 'HTTP/list_user_response.dart';
import 'HTTP/user.dart';
///This Page is used how will show the product
class show_event extends StatefulWidget {
  final String image;
  const show_event({ Key key, this.image}) : super(key: key);

  @override
  _ShowState createState() => _ShowState();
}

class _ShowState extends State<show_event> {
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
    ///to get the data after action happen in other widget to show the data
    ///in this page
    final String _data = ModalRoute.of(context).settings.arguments;
    ///to control the arrow back when clicked!
    return WillPopScope(
      onWillPop: ()=> Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => artist()),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          /// here is the designed way.!
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
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child:
                  Container(
                        padding: const EdgeInsets.all(20),
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
                                    style: const TextStyle(
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
                                  style: const TextStyle(
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
                                              fontFamily: 'koliko',
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
      ),
    );
  }
}