import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/controller/card_data_contolloer.dart';
import '../const.dart';



  Future<bool> addremovecard(
      {required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.get(keyAccessToken).toString();
    var url = Uri.parse('$baseURL/carts');
    String   language = prefs.get('lang2').toString();

    var response = await http.post(url, headers: {
      'lang':(language!='ar')?'en':'ar',
      'Authorization':token,
    }, body: {
      "product_id": '${id}',
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
    bool status = jsonDecode(response.body)['status'];
    print('>>>>>>>>>>>>>>>>> $status');

    return status;
  }



