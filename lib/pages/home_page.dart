import 'package:flutter/material.dart';

import '../widgets/drawer.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "Shubham";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shubham"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome in $days days flutter wolrd with $name "),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
