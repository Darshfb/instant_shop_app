import 'package:collection/src/iterable_extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart' as http;
import 'package:softagi/model/cart_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:softagi/model/home_data_model.dart';
import 'package:softagi/model/test.dart';

import 'AppLanguage/app_language.dart';
import 'AppLanguage/local_storage.dart';

RxInt? maxtotal;

class cartcontroller extends GetxController {
  int? total1;
  final RxList<totalmodel> tot = <totalmodel>[].obs;

  final RxList<cartiteme> cartit = <cartiteme>[].obs;

  // RxInt quantity1=cartit[index].quantity.obs;

  //RxInt quantity123=quantity1.obs;
  // List<cartiteme>cartit=[];
  double totalprice = 0.0;
  List<modelproducts> pro = [];

  // List<testproduckt>products=[];
  var totall;
  var sum = 0.obs;
  var subtotal;

  // void addcart(cartiteme cart){
  //   cartit.add(cart.quantity++);
  //   update();
  // }
  RxInt totalitems() {
    sum = RxInt(totall);
    return sum;
  }

  void add(cartiteme cart) {
    cartit.add(cart);
  }

  int get count {
    return cartit.length;
  }

  void delete(int cart) {
    cartit.removeAt(cart);
    update();
  }
  refrash(){
    gethomedata1();
    update();
  }

  cartcontroller() {
    gethomedata1();
  }

  Future gethomedata1() async {
    try {
      cartit.clear();
      var url = Uri.parse(baseURL + '/carts');
      print(url);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get(keyAccessToken).toString();
      String language = prefs.get('lang2').toString();

      print("token cart${token}");
      var respone = await http.get(url, headers: {
        'lang': (language != 'ar') ? 'en' : 'ar',
        'Authorization': token
      });
      totall = jsonDecode(respone.body)['data']['total'];
      subtotal = jsonDecode(respone.body)['data']['sub_total'];

      print(respone.statusCode);
      var responsebody2 = jsonDecode(respone.body)['data']['cart_items'];

      print('sssssssssssssssssssss $responsebody2');

      print('a7a ynaaaaaaaaaas2${responsebody2}');
      for (int x = 0; x < responsebody2.length; x++) {
        cartit.add(cartiteme.fromMap(responsebody2[x]));
      }
    } catch (e) {
      print('error=<<000000000<<<$e');
    }
    update();
  }
}

Future<String> gethomedata1() async {
  List<cartiteme> cartit = [];

  var totall;
  var url = Uri.parse(baseURL + '/carts');
  print(url);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.get(keyAccessToken).toString();
  String? language = prefs.get('lang2').toString();

  print("token cart${token}");
  var respone = await http.get(url, headers: {
    'lang': (language != 'ar') ? 'en' : 'ar',
    'Authorization': token
  });
  totall = jsonDecode(respone.body)['data']['total'];
  var responsebody2 = jsonDecode(respone.body)['data']['cart_items'];

  for (int x = 0; x < responsebody2.length; x++) {
    cartit.add(cartiteme.fromMap(responsebody2[x]));
  }

  print('afasfsaaf${totall.toString()}');
  return totall.toString();
}

Future<String> cartlength() async {
  List<cartiteme> cartit = [];

  var totall;

  var url = Uri.parse(baseURL + '/carts');
  print(url);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.get(keyAccessToken).toString();
  String? language = prefs.get('lang2').toString();

  print("token cart${token}");
  var respone = await http.get(url, headers: {
    'lang': (language != 'ar') ? 'en' : 'ar',
    'Authorization': token
  });
  totall = jsonDecode(respone.body)['data']['total'];
  var responsebody2 = jsonDecode(respone.body)['data']['cart_items'];

  for (int x = 0; x < responsebody2.length; x++) {
    cartit.add(cartiteme.fromMap(responsebody2[x]));
  }

  print('afasfsaaf${totall.toString()}');
  return cartit.length.toString();
}
