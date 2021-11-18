import 'package:flutter/material.dart';
import 'package:untitled5/profile.dart';

import 'landing.dart';
import 'login_page.dart';
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
            title: const Text("Title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context){
                      return HomePage();
                    }));
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
                  icon: Icon(Icons.home),
                  text: 'الصفحة الرئيسية',
                ),
                Tab(
                  icon: Icon(Icons.map),
                  text: 'خطتي',
                ),
                Tab(
                  icon: Icon(Icons.map),
                  text: 'الخريطة',
                ),
                Tab(
                  icon: Icon(Icons.map),
                  text: 'الملف الشخصي',
                ),
              ],
            ),
          ),
          body: TabBarView(children: [landing(), Login(), map_page(),
           Profile()]),
        ));
  }


}