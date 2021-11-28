import 'package:flutter/material.dart';
import 'package:untitled5/plan.dart';
import 'package:untitled5/profile.dart';
import 'package:untitled5/register.dart';

import 'landing.dart';
import 'login.dart';

import 'map_page.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return _home_state();
  }
}

class _home_state extends State<home>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Home",
              style: TextStyle(fontSize: 30, fontFamily: 'koliko'),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                // Navigator.pop(context,
                //     MaterialPageRoute(builder: (context){
                //       return HomePage();
                //     }));
              },
              icon: const Icon(Icons.door_back_door),
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.door_front_door),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Login();
                    }),
                  );
                },
              )
            ],
            elevation: 10,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              isScrollable: false,
              tabs: [
                Tab(
                  icon: Icon(Icons.festival_sharp),
                  text: 'Events',
                ),
                Tab(
                  icon: Icon(Icons.chrome_reader_mode_rounded),
                  text: 'My Plan',
                ),
                Tab(
                  icon: Icon(Icons.map_rounded),
                  text: 'Map',
                ),
                Tab(
                  icon: Icon(Icons.account_circle),
                  text: 'Profile',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [landing(), plan(), map_page(),
           profile()]),
        ));
  }


}