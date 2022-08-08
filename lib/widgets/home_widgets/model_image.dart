// this is for model Image

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/theme.dart';

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
