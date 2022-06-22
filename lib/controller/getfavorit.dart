
import 'package:collection/src/iterable_extensions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'package:softagi/model/cart_model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:softagi/model/favo_model.dart';

import 'AppLanguage/app_language.dart';
import 'AppLanguage/local_storage.dart';
RxInt? maxtotal;

class getfavort extends GetxController{
  bool? status;


  // RxInt quantity1=cartit[index].quantity.obs;

  //RxInt quantity123=quantity1.obs;
  List<favomodel>products=[];
  //
  void delete(int cart){
    products.removeAt(cart);
    update();
  }


  getfavort(){
    gethomedata1().then((value)=>update());
  }
  Future gethomedata1()async{
    try{
      var url = Uri.parse(baseURL+'/favorites');
      print(url);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get(keyAccessToken).toString();
      String   language = prefs.get('lang2').toString();

      print("token cart${token}");
      var respone=await http.get(url,headers:{
        'lang':(language!='ar')?'en':'ar',
        'Authorization':token
      });


      print(respone.statusCode);
      var responsebody2=jsonDecode(respone.body)['data']['data'];
      status=jsonDecode(respone.body)['status'];

      print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz $status');
      for(int x=0;x<responsebody2.length;x++){
        products.add(favomodel.fromMap(responsebody2[x]));

      }

    }catch(e){
      print('error=<<000000000<<<$e');
    }
  }


}



