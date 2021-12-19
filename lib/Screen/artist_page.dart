import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled5/Screen/product.dart';
import 'package:untitled5/translations/locale_keys.g.dart';
import '../HTTP/http_service.dart';
import '../HTTP/list_user_response.dart';
import '../HTTP/user.dart';
import 'event_page.dart';

//Custom Class to show the data.
class Category {
  String name, image;
  Category({this.name, this.image});
}
//Custom list to show the data.
class artistsData {
  final List<Category> _myList = <Category>[
    Category(name: 'artist1', image: 'assets/log_in.png'),
    Category(name: 'artist2', image: 'assets/log_in.png'),
    Category(name: 'artist3', image: 'assets/log_in.png'),
    Category(name: 'artist4', image: 'assets/log_in.png'),
    Category(name: 'artist5', image: 'assets/log_in.png'),
  ];
  List<Category> get myList => _myList;
}
//Artist Page
class artists_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Test',
      home: artist(),
    );
  }
}

class artist extends StatefulWidget {
  @override
  _ArtistsState createState() => _ArtistsState();
}

class _ArtistsState extends State<artist> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String ValueChoose;
  bool CheckBoxValue = false;
  bool isLoading = false;
  //API connection.
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return event();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(right: 200.0),
            child: Text(
              LocaleKeys.Artists.tr(),
              style: const TextStyle(fontSize: 26, fontFamily: 'koliko'),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 5.0, top: 10.0, right: 5.0, bottom: 0.0),
              child: Column(children: [
                //gridView Builder.
                GridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: _artistsList.length,
                  itemBuilder: (BuildContext context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          delay: const Duration(milliseconds: 100),
                          child: mylistItem(_artistsList[index]),
                        ),
                      ),
                    );
                    // final user = users[index];
                    // const SizedBox(width: 10.0);
                    // const Padding(
                    //     padding: EdgeInsets.all(8.0));
                    // return makeItem(
                    // title: Text(user.firstName),
                    // leading: Image.network(user.avatar),
                    // subtitle: Text(user.email),
                    //   "assets/events.jpeg",
                    //   user.firstName,
                    //   user.firstName);
                  },
                  // itemCount: users.length,
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
  //this is the design created to show a list of data.!
  Widget mylistItem(Category category) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 183,
              height: 169,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0)),
                image: DecorationImage(
                  image: AssetImage(category.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'koliko',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 65.0),
                  child: GestureDetector(
                    child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => show_event(
                                    image: category.image,
                                  ),
                              settings: RouteSettings(arguments: category.toString())),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
