import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/add_favort.dart';
import 'package:softagi/controller/add_or_remove%20_card_controller.dart';
import 'package:softagi/controller/home_data_controller.dart';
import 'package:softagi/view/widgets/custom_text.dart';

import '../../const.dart';
import '../../theme.dart';
class descriptionScreen extends StatelessWidget {
  String? title;
  String? image;
  dynamic price;
  dynamic oldPrice;
  String? description;
  String? name;
  int? id;

  descriptionScreen(
      {this.title,
        this.id,
        this.image,
        this.price,
        this.oldPrice,
        this.description,
        this.name,
        });
  final homedatacontroller c = Get.put(homedatacontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                child: Hero(

                    tag: '$name', child: Image.network('$image')),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        custom_text(
                          text: 'Price',
                          style: titlestyle,
                        ),
                        custom_text(text: price, style: newprice,),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    Column(
                      children: [
                        custom_text(
                          text: 'Old Price',
                          style: titlestyle,
                        ),
                        custom_text(
                          text: oldPrice,
                          style: oldprice,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetBuilder<homedatacontroller>(
                    builder: ( controller) {
                      return Container(

                        child: IconButton(onPressed: (){
                          addremovecard(id: controller.products[index].id!);
                        },icon: Icon(Icons.shopping_cart_rounded,color: Colors.red[800],),iconSize: 30,),
                      );
                    },),                  IconButton(onPressed: () {
                    addfavort(id:id!);

                  }, icon: Icon(Icons.favorite_border_outlined),),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsetsDirectional.only(
                    top: 10, bottom: 30, start: 10, end: 10),
                child: custom_text(
                  text: '$description',
                  textAlign: TextAlign.right,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
