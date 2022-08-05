class Item {
  final String id;
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

final products = [
  Item(
      id: "Shubham 01",
      name: "Iphone 12",
      desc: "Apple iphone 12th generation ",
      price: 55000,
      color: "Black",
      image: "")
];
