
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softagi/controller/home_data_controller.dart';
import 'package:softagi/controller/search_contrlloer.dart';
import 'package:softagi/services/theme_services.dart';
import 'package:softagi/theme.dart';
import 'package:softagi/view/Screens/categories.dart';
import 'package:softagi/view/Screens/favorites.dart';
import 'package:softagi/view/Screens/home_screen.dart';
import 'package:softagi/view/Screens/settings.dart';

import 'controller/updatecard_controller.dart';
Color primaryColor = Color(0xff4E9F3D);
Color secondaryColor = Color(0xffD8E9A8);
Color white = Colors.white;
const backGround=Color.fromRGBO(238, 240, 249, 1);
String? test;

String baseURL = 'https://student.valuxapps.com/api';
const String keyAccessToken= 'access_token';
int? items;

var base64Image;
TextEditingController text = TextEditingController();

class favo extends GetxController{

  change({required int fo,required bool bo}){

   bo=!bo;
    update();

  }

}

int index = 0;
class bot extends GetxController{
  int index = 0;
  List<Widget> screens = [
    homeScreen(),
    categories(),
    favorites(),
    settings(),
  ];
  void change(int value){
    index=value;
    screens[index];
    update();
  }

}
class deletecart extends GetxController{
  int? quantity;
  int? id;
  void plus(){
    updatecard(quantity:quantity!,id: id!);
    update();
  }
  void min(quantity,id){
    updatecard(quantity:quantity,id: id);
    update();
  }

}

// class search1 extends GetxController{
//
//   void change(value){
//    Searchcontrller().search(text: value);
//     update();
//   }
//
// }

