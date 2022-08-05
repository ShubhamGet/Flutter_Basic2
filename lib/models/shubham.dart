import 'package:flutter/material.dart';

class Model {
  static final items = [
    Item(
      id: 1,
      name: "Iphone 12pro",
      desc: "Apple iphone 12th generation ",
      price: 999,
      color: "Black",
      image: "assets/images/iphone12.jpeg",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
