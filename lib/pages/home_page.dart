// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_basic_concept/models/shubham.dart';
import 'package:flutter_basic_concept/widgets/home_widgets/model_header.dart';
import 'package:flutter_basic_concept/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/home_widgets/model_list.dart';

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
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ModelHeader(),
              if (Model.items != null && Model.items.isNotEmpty)
                ModelList().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
    );

    /*
    it was the first way to show the item in the rows form
    -----------------------------------------------------
    return Scaffold(
      appBar: AppBar(
        title: Text("Shubham"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: unnecessary_null_comparison
        child: (Model.items != null && Model.items.isNotEmpty)
            ? ListView.builder(
                itemCount: Model.items.length,
                itemBuilder: (context, index) => ItemWidget(
                  item: Model.items[index],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );*/
  }
}
