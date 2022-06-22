import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:softagi/const.dart';
import 'package:softagi/view/Screens/settings.dart';
import 'package:softagi/view/Screens/update_profile.dart';
Future<bool> updateprofilee(
    {
      required String image,
      required String name,
      required String phone,
      required String email,
      required String password}) async
{
  var url = Uri.parse('$baseURL/update-profile');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? language= prefs.get('lang2').toString();
  String? token = prefs.get(keyAccessToken).toString();

  var response= await http.put(url,
      headers: {
        'lang':(language!='ar')?'en':'ar',
        'Authorization':token

      },
      body:{
        'name' : name,
        'phone' : phone,
        'email' : email,
        'password' : password,
        'image':image,

      }
  );
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
  return status;
}