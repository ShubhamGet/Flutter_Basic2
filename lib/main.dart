import 'package:flutter/material.dart';
import 'package:flutter_basic_concept/pages/home_page.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_basic_concept/pages/login_page.dart';
import 'package:flutter_basic_concept/utils/routes.dart';
import 'package:flutter_basic_concept/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),

      debugShowCheckedModeBanner: false, //for erase the debugs icon
      initialRoute: "/home",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
