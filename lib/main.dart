import 'package:flutter/material.dart';
import 'package:flutter_basic_concept/pages/home_page.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_basic_concept/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        //primaryTextTheme: GoogleFonts.latoTextTheme()
      ),

      initialRoute: "/login",
      darkTheme: ThemeData(primarySwatch: Colors.green),
      routes: {
        "/": (context) => LoginPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
      },
    );
  }
}
