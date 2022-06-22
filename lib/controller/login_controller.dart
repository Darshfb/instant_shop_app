import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/model/profil_model.dart';
import 'package:softagi/view/auth_container.dart';

import '../const.dart';

bool? state;
Future<bool> loginApi(
    {required String email, required String password}) async {
  var url = Uri.parse('$baseURL/login');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? language= prefs.get('lang2').toString();
  var response = await http.post(url, headers: {
    'lang':(language!='ar')?'en':'ar',
  }, body: {
    "email": email,
    "password": password
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
  var responsebody=jsonDecode(response.body)['data'];
  // for(int x = 0; x < responsebody.length; x++)
  // {
  //   profile.add(profileemodel.fromMap(responsebody[x]));
  //
  // }
  String message = jsonDecode(response.body)['message'];
  state = jsonDecode(response.body)['status'];
  String token = jsonDecode(response.body)['data']['token'];
  prefs.setString(keyAccessToken, token);

   bool status = jsonDecode(response.body)['status'];


  return status;
}
