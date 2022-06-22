import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'package:softagi/model/cart_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
class cartnum extends GetxController{
  int? total1;
  var quantity1;
  var cart=RxList<cartiteme>().obs;
  var isloading = true.obs;
  RxInt? num1;
  List<cartiteme>cartit=[];
  List<testproduckt>products=[];
  int get count{
    return cartit.length;
  }
  int max(){
    int index;
    index= cartit.length;
    update();
    return index;
  }

  Future gethomedata1()async{
    try{

      var url = Uri.parse(baseURL+'/carts');
      print(url);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get(keyAccessToken).toString();
      print("token cart${token}");
      var respone=await http.get(url,headers:{
        'Authorization':token
      });
      total1=jsonDecode(respone.body)['data']['total'];


      print(respone.statusCode);
      var responsebody2=jsonDecode(respone.body)['data']['cart_items'];
      print('sssssssssssssssssssss $responsebody2');

      print('a7a ynaaaaaaaaaas2${responsebody2}');
      for(int x=0;x<responsebody2.length;x++){
        cartit.add(cartiteme.fromMap(responsebody2[x]));
        RxInt num=cartit.length.obs;
        num1=num;

      }


    }catch(e){
      print('error=<<000000000<<<$e');
    }

  }

}
