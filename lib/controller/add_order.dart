import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/model/address_model.dart';
import 'package:softagi/model/profil_model.dart';
import 'package:softagi/view/Screens/MainScreen.dart';
import 'package:softagi/view/Screens/orderhistory.dart';
import 'package:softagi/view/auth_container.dart';

import '../const.dart';

Future<String> addorder(
    { required int id}) async {
  List<AdressModel>address=[];
  var url = Uri.parse('$baseURL/orders');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? language= prefs.get('lang2').toString();
  String? token = prefs.get(keyAccessToken).toString();

  var response = await http.post(url, headers: {
    'lang':(language!='ar')?'en':'ar',
    'Authorization':token

  }, body: {
    "use_points":"false",
    "payment_method":"1",
    "address_id":'${id}',


  });
  String message = jsonDecode(response.body)['message'];

  print('Response Body > ${response.body}');
  print('status code > ${response.statusCode}');
  if (jsonDecode(response.body)['status'] == true) {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red);
    Get.snackbar(
      message, 'Thanks For Your Order, '
        'it will be speedy, have a nice day.',duration: Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
      icon:Icon(Icons.check_sharp),
      colorText: Colors.white,
      onTap:(context){
        Get.to(orderhistory());
      },
      animationDuration: Duration(seconds: 3),

      backgroundColor: Colors.blue,
      backgroundGradient:LinearGradient(
        colors: [
          Color(0xff243B55),
          Color(0xff141E30)

        ],
      ),


    );
  } else {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red);
  }
  // List<profileemodel>profile=[];
  var responsebody=jsonDecode(response.body)['data'];
  for(int x = 0; x < responsebody.length; x++)
  {
    address.add(AdressModel.fromMap(responsebody[x]));

  }
  prefs.setString(keyAccessToken, token);

  bool status = jsonDecode(response.body)['status'];


  return message;
}
