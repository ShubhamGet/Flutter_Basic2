// this is for header formating
import 'package:flutter/material.dart';
import 'package:flutter_basic_concept/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
