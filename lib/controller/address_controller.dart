import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/address_model.dart';

class AdressController extends GetxController {
  AdressController(){
    gethomedata1().then((value) => update());
  }
List<AdressModel>title=[];

  Future gethomedata1()async{
    try{

      var url = Uri.parse(baseURL+'/addresses');
      print(url);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get(keyAccessToken).toString();
      print("token cart${token}");
      var respone=await http.get(url,headers:{
        'Authorization':token
      });

      print(respone.statusCode);
      var responsebody2=jsonDecode(respone.body)['data']['data'];
      print('sssssssssssssssssssss $responsebody2');
      for(int x=0;x<responsebody2.length;x++){
        title.add(AdressModel.fromMap(responsebody2[x]));
      }


    }catch(e){
      print('error=<<000000000<<<$e');
    }

  }

}