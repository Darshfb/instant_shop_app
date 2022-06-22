import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'package:softagi/model/category_model.dart';
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
class categoriescontroller extends GetxController{
  List<categoriesmodel>category=[];

  categoriescontroller(){
    getcategoriesdata().then((value) => update());

  }
  Future getcategoriesdata()async{
    try{

      var url = Uri.parse(baseURL+'/categories');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? language= prefs.get('lang2').toString();
      var respone=await http.get(url,headers:{
        'lang':(language!='ar')?'en':'ar',
      });
      var responebody=jsonDecode(respone.body)['data']['data'];
      print('responebody:>>>>>$responebody');
      print(respone.statusCode);
      for(int x = 0; x < responebody.length; x++)
      {
        category.add(categoriesmodel.fromMap(responebody[x]));
      }
    }catch(e){
      print('error=<<<<<$e');
    }

  }

}
Future getcategoriesdata()async{
  try{
    List<categoriesmodel>category=[];

    var url = Uri.parse("http://api.aladhan.com/v1/timingsByCity?city=Riyadh&country=Saudi%20Arabia&method=4&fbclid=IwAR09aORcy9DFRIaNJ3mzYnmuPS-CFs4744knKs1M4Xo53u43f2kZVlujyQ8");
    var respone=await http.get(url);
    var responebody=jsonDecode(respone.body)['data']['timings'];
    print('responebody:>>>>>$responebody');
    print(respone.statusCode);
    for(int x = 0; x < responebody.length; x++)
    {
      category.add(categoriesmodel.fromMap(responebody[x]));
    }
  }catch(e){
    print('error=<<<<<$e');
  }

}