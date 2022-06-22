import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
class homedatacontroller extends GetxController{
  List<modelbanners>banner=[];
  List<modelproducts>products=[];
  // List<homemodel>home=[];
reupdate(){
  gethomedata();
  update();
  products.clear();
}
  homedatacontroller(){
    gethomedata();

  }
  Future gethomedata()async{
    try{

      var url = Uri.parse(baseURL+'/home');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? language= prefs.get('lang2').toString();
      print("language----->$language");
      var respone=await http.get(url,headers:{
        'lang':(language!='ar')?'en':'ar',
      });
      var responebody3=jsonDecode(respone.body)['data']['products'];

      print('yeeeeee${responebody3}');
      var responebody1=jsonDecode(respone.body)['data']['banners'];
      // var responebody4=jsonDecode(respone.body)['data']['products'];
      //
      // for(int x = 0; x < responebody4.length; x++)
      // {
      //   home.add(homemodel.fromMap(responebody4[x]));
      // }

      for(int x = 0; x < responebody1.length; x++)
          {
             banner.add(modelbanners.fromMap(responebody1[x]));
          }


      for(int i= 0; i < responebody3.length; i++)
      {
        products.add(modelproducts.fromMap(responebody3[i]));


      }
    }catch(e){
      print('error=<<<<<$e');

    }
    update();

  }

}
