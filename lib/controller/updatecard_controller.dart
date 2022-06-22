import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../const.dart';

// class updatecartcontroller extends GetxController{
//   var quantity;
//   var id;
//   updatecartcontroller(){
//     updatecard(id: id,quantity: quantity).then((value) => update());
//   }
//   Future<bool> updatecard(
//       {required var id,required var quantity}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.get(keyAccessToken).toString();
//     var url = Uri.parse('$baseURL/carts/${id}');
//     var response = await http.post(url, headers: {
//       "lang": "ar",
//       'Authorization':token,
//     }, body: {
//       "quantity": '${quantity}',
//     });
//     print('Response Body > ${response.body}');
//     print('status code > ${response.statusCode}');
//     if (jsonDecode(response.body)['status'] == true) {
//       Fluttertoast.showToast(
//           msg: jsonDecode(response.body)['message'],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red);
//     } else {
//       Fluttertoast.showToast(
//           msg: jsonDecode(response.body)['message'],
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red);
//     }
//     bool status = jsonDecode(response.body)['status'];
//     print('>>>>>>>>>>>>>>>>> $status');
//     return status;
//   }
// }
Future<bool> updatecard(
    {required int id,required int quantity}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.get(keyAccessToken).toString();
  String? language= prefs.get('lang2').toString();
  var url = Uri.parse('$baseURL/carts/${id}');
  print(url);
  var response = await http.put(url, headers: {
    'lang':(language!='ar')?'en':'ar',
    'Authorization':token,
  }, body: {
    "quantity": "${quantity.toString()}",
  });
  print('Response Body > ${response.body}');
  print('status code > ${response.statusCode}');
  print(jsonDecode(response.body)['message']);
  if (jsonDecode(response.body)['status'] == true) {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red);
  } else {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red);
  }
  bool status = jsonDecode(response.body)['status'];
  print('>>>>>>>>>>>>>>>>> $status');
  return status;
}