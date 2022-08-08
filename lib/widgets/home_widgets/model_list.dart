// this is for Model List formating

import 'package:flutter/material.dart';
import 'package:flutter_basic_concept/models/shubham.dart';
import 'package:flutter_basic_concept/pages/home_detail.dart';
import 'package:flutter_basic_concept/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'model_image.dart';

class ModelList extends StatelessWidget {
  const ModelList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Model.items.length,
      itemBuilder: (context, index) {
        final model = Model.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(model: model),
            ),
          ),
          child: ModelItem(model: model),
        );
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
        Hero(
          tag: Key(model.id.toString()),
          child: ModelImage(
            image: model.image,
          ),
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
