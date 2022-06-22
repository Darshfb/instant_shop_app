import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
Future cancelorder({required int id})async{


    var url = Uri.parse(baseURL+'/orders/$id/cancel/');
    print(url);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.get(keyAccessToken).toString();
    print("token cart${token}");
    var respone=await http.get(url,headers:{
      'Authorization':token
    });

    print(respone.statusCode);
    var message=jsonDecode(respone.body)['message'];
    if (jsonDecode(respone.body)['status'] == true) {
      Fluttertoast.showToast(
          msg: jsonDecode(respone.body)['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red);
    } else {
      Fluttertoast.showToast(
          msg: jsonDecode(respone.body)['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red);
    }



}