import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/const.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import 'package:softagi/controller/cart_num.dart';

import '../../theme.dart';
import 'custom_text.dart';

class cart_num extends StatelessWidget {
  cartcontroller controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return GetX<cartcontroller>(
      builder: ( controller)
    {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Badge(
          position: BadgePosition.topEnd(top: -12),
          animationDuration: Duration(milliseconds: 300),
          animationType: BadgeAnimationType.slide,
          showBadge: (controller.cartit.length.toString()=='0')?false:true,
          badgeContent: Text(controller.cartit.length.toString(),),
          child: Icon(Icons.shopping_cart,color: Colors.deepOrange),
        ),
      );
    }
    );
  }
}
