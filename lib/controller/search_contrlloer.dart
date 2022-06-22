import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/model/home_data_model.dart';
import 'package:softagi/model/profil_model.dart';
import 'package:softagi/view/auth_container.dart';

import '../const.dart';
Future <List<modelproducts>> search() async {

  var url = Uri.parse('$baseURL/products/search');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.get(keyAccessToken).toString();
  var response = await http.post(url, headers: {
    'Authorization':token,
    "lang": "ar",
  }, body: {
    "text": '${text.text}',
  }
  );
  print('Response Body > ${response.body}');
  print('status code > ${response.statusCode}');

  var responsebody=jsonDecode(response.body)['data']['data'];
  List<modelproducts>product=[];

  // for(var i in responsebody){
  //   modelproducts user = modelproducts(id:i['id'],image:i['image'],price:i['price'] ,name:i['name'] ,description:i['description'] ,in_cart:i['in_cart'] ,in_favorites:i['in_favorites'] ,old_price:i['old_price'] );
  // product.add(user);
  // }
  for(int x=0;x<responsebody.length;x++)
  {
    product.add(modelproducts.fromMap(responsebody[x]));
  }
  return product;

}
class Searchcontrller extends GetxController{



  Searchcontrller(){
    search().then((value) => update());
  }
  Future search() async {
    List<modelproducts>product=[];

    var url = Uri.parse('$baseURL/products/search');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.get(keyAccessToken).toString();
    String? language= prefs.get('lang2').toString();
    var response = await http.post(url, headers: {
      'Authorization':token,
      'lang':(language!='ar')?'en':'ar',
    }, body: {
      "text": '${text.text}',
    }
    );
    print('Response Body > ${response.body}');
    print('status code > ${response.statusCode}');

    var responsebody=jsonDecode(response.body)['data']['data'];
    for(int x=0;x<responsebody.length;x++)
      {
        product.add(modelproducts.fromMap(responsebody[x]));
      }
    update();
  }
}
