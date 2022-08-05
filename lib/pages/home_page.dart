import 'package:flutter/material.dart';
import 'package:flutter_basic_concept/models/shubham.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  int days = 30;
  String name = "Shubham";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shubham"),
      ),
      body: ListView.builder(
        itemCount: Model.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: Model.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
