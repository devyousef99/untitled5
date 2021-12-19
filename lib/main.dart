import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled5/Screen/login.dart';
import 'package:untitled5/Screen/register.dart';
import 'package:untitled5/sign_up.dart';
import 'package:untitled5/splash_screen.dart';
import 'package:untitled5/translations/codegen_loader.g.dart';

Future<void> main() async {
  //To initilaized the localization for the hole app.
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    //This widget is used to declare the language that will be used in app.!
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      //If non of the listed language is shown be default will show English
      fallbackLocale: Locale('en'),
      //To load the translation language file.!
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
