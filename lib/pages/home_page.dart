// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_basic_concept/models/shubham.dart';
import 'package:flutter_basic_concept/widgets/theme.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

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
                Center(
                  child: CircularProgressIndicator(),
                )
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

// this is for header formating
class ModelHeader extends StatelessWidget {
  ModelHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Iphone Product".text.bold.xl3.color(MyTheme.darkBluishColor).make(),
      ],
    );
  }
}

// this is for Model List formating

class ModelList extends StatelessWidget {
  const ModelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Model.items.length,
      itemBuilder: (context, index) {
        final model = Model.items[index];
        return ModelItem(model: model);
      },
    );
  }
}

// this is for ModelItem widget formating

class ModelItem extends StatelessWidget {
  final Item model;

  const ModelItem({super.key, required this.model}) : assert(model != null);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        ModelImage(
          image: model.image,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.name.text.lg.color(MyTheme.darkBluishColor).make(),
            model.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${model.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyTheme.darkBluishColor,
                        ),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 9)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

// this is for model Image

class ModelImage extends StatelessWidget {
  final String image;

  const ModelImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
