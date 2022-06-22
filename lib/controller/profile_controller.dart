import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'dart:async';
import 'dart:convert';

import 'package:softagi/model/home_data_model.dart';
import 'package:softagi/model/profil_model.dart';

class profilecontroller extends GetxController{
  List<profileemodel>profile=[];
  String? email;
  String? name;
  String? image;

  profilecontroller(){
    profiledata().then((value) => update());

  }

   Future profiledata()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.get(keyAccessToken).toString();
      String? language= prefs.get('lang2').toString();
      print("=====tokennnnn${token}");
      var url = Uri.parse(baseURL+'/profile');
      var respone=await http.get(url,
          headers:{
            'lang':(language!='ar')?'en':'ar',

            'Authorization':token,

          });
      email= jsonDecode(respone.body)['data']['email'];
      name= jsonDecode(respone.body)['data']['name'];
      image= jsonDecode(respone.body)['data']['image'];
      update();
    }catch(e){
      print('error=<<<<<$e');
    }

  }

}

Future <String> profileemail()async{

    String? email;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.get(keyAccessToken).toString();
    String? language= prefs.get('lang2').toString();
    print("=====tokennnnn${token}");
    var url = Uri.parse(baseURL+'/profile');
    var respone=await http.get(url,
        headers:{
          'lang':(language!='ar')?'en':'ar',

          'Authorization':token,

        });
    email= jsonDecode(respone.body)['data']['email'];


return email! ;

}
Future <String> profilename()async{


  String? name;

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.get(keyAccessToken).toString();
  String? language= prefs.get('lang2').toString();
  print("=====tokennnnn${token}");
  var url = Uri.parse(baseURL+'/profile');
  var respone=await http.get(url,
      headers:{
        'lang':(language!='ar')?'en':'ar',

        'Authorization':token,

      });
  name= jsonDecode(respone.body)['data']['name'];

  return name! ;

}
Future <String> profileimage()async{


  String? image;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.get(keyAccessToken).toString();
  String? language= prefs.get('lang2').toString();
  print("=====tokennnnn${token}");
  var url = Uri.parse(baseURL+'/profile');
  var respone=await http.get(url,
      headers:{
        'lang':(language!='ar')?'en':'ar',

        'Authorization':token,

      });

  image= jsonDecode(respone.body)['data']['image'];

  return image! ;

}
