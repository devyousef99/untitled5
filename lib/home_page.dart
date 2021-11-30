import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/plan.dart';
import 'package:untitled5/profile.dart';
import '../translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'landing.dart';
import 'login.dart';
import 'map_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _home_state();
  }
}

class _home_state extends State<home> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _validateLanguage() async {
    //If all data are correct then save data to out variables
    if (context.locale == Locale('en')) {
      return context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              LocaleKeys.home_page.tr(),
              style: const TextStyle(fontSize: 30, fontFamily: 'koliko'),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: _validateLanguage,
              icon: const Icon(Icons.explicit_rounded),
              iconSize: 30,
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
            bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              isScrollable: false,
              tabs: [
                Tab(
                  icon: const Icon(Icons.festival_sharp),
                  text: LocaleKeys.Events_page.tr(),
                ),
                Tab(
                  icon: const Icon(Icons.chrome_reader_mode_rounded),
                  text: LocaleKeys.MyPlan_page.tr(),
                ),
                Tab(
                  icon: const Icon(Icons.map_rounded),
                  text: LocaleKeys.Map_page.tr(),
                ),
                Tab(
                  icon: const Icon(Icons.account_circle),
                  text: LocaleKeys.profile.tr(),
                ),
              ],
            ),
          ),
          body:
              TabBarView(children: [landing(), plan(), map_page(), profile()]),
        ));
  }
}
