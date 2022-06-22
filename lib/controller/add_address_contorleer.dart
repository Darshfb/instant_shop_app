import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/model/address_model.dart';
import 'package:softagi/model/profil_model.dart';
import 'package:softagi/view/Screens/MainScreen.dart';
import 'package:softagi/view/auth_container.dart';

import '../const.dart';

int? id;
Future<String> addAddress(
    {required String name, required String notes,required String city, required String region,required String details}) async {
  List<AdressModel>address=[];
  var url = Uri.parse('$baseURL/addresses');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? language= prefs.get('lang2').toString();
  String? token = prefs.get(keyAccessToken).toString();

  var response = await http.post(url, headers: {
    'lang':(language!='ar')?'en':'ar',
    'Authorization':token

  }, body: {
    "longitude":"31.3260088",
    "latitude":"30.0616863",
    "notes":notes,
    "details":details,
    "region":region,
    "city":city,
    "name":name,

  });
  print('Response Body > ${response.body}');
  print('status code > ${response.statusCode}');
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
  // List<profileemodel>profile=[];
  id=jsonDecode(response.body)['data']['id'];
  print('aaaaaaabbbbbbbbbbbbbbbbbccccccccccccc $id');

  String message = jsonDecode(response.body)['message'];
  prefs.setString(keyAccessToken, token);

  bool status = jsonDecode(response.body)['status'];
  if(status==true){
    Get.offAll(bottom_navigation_bar());
  }

  return message;
}
