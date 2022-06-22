import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../const.dart';

bool? state;

Future<bool> forgetpasswardapi(
    {required String email}) async {
  var url = Uri.parse('$baseURL/verify-email');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? language= prefs.get('lang2').toString();
  var response = await http.post(url, headers: {
    'lang':(language!='ar')?'en':'ar',
  }, body: {
    "email": email,
  });
  if (jsonDecode(response.body)['status'] == true) {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green);
  } else {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red);
  }
  state = jsonDecode(response.body)['status'];
  bool status = jsonDecode(response.body)['status'];
  return status;
}


Future<bool> resetpasswordapi(
    {required String email,required String code,required String passward,}) async {
  var url = Uri.parse('$baseURL/reset-password');
  var response = await http.post(url, headers: {
    "lang": "ar",
  }, body: {
    "email": email,
    "code":code,
    'password':passward,
  });
  if (jsonDecode(response.body)['status'] == true) {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green);
  } else {
    Fluttertoast.showToast(
        msg: jsonDecode(response.body)['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green);
  }
  state = jsonDecode(response.body)['status'];
  bool status = jsonDecode(response.body)['status'];
  return status;
}