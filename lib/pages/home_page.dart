// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_basic_concept/models/shubham.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int days = 30;

  String name = "Shubham";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final datajson = await rootBundle.loadString("assets/files/data.json");
    final decodedData = jsonDecode(datajson);
    var productData = decodedData["product"];
    Model.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shubham"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (Model.items != null && Model.items.isNotEmpty)
            ? ListView.builder(
                itemCount: Model.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    item: Model.items[index],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
