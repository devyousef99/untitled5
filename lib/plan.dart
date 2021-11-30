import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/artist_page.dart';
///plan page ofr the user.
class PlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ///to control the arrow back when clicked!
    return WillPopScope(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('My Plan'),
          ),
          body: plan(),
        ),
        onWillPop: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => artist()),
            ));
  }
}

class plan extends StatefulWidget {
  @override
  _PlantState createState() => _PlantState();
}

class _PlantState extends State<plan> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String ValueChoose;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String _data = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/update homepage.png"),
          fit: BoxFit.fill,
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 190),
            child: Column(
              children: [
                const Text("My Plan",
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  ///this is the design created to show a list of data.!
  Widget makeItem(String image, tag, String name, String _name) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundImage: AssetImage(image),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                _name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          // const Spacer(),
          // InkWell(
          //   onTap: () {
          //      Navigator.push(
          //        context,
          //        MaterialPageRoute(builder: (context) {
          //          return map_page();
          //        }),
          //      );
          //   },
          //    child: AnimatedContainer(
          //     width: 100,
          //      height: 32,
          //      duration: const Duration(milliseconds: 300),
          //      child: const Center(
          //        child: Text(
          //          'ADD',
          //          style: TextStyle(
          //            color: Colors.white,
          //          ),
          //        ),
          //      ),
          //    ),
          // ),
        ],
      ),
    );
  }
}
