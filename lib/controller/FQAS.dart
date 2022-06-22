import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/const.dart';
import 'package:http/http.dart'as http;
import 'package:softagi/model/FAQS.dart';
import 'dart:async';
import 'dart:convert';

class faqscontroller extends GetxController{
  List<fqamodel>fqa=[];
  faqscontroller(){
    getfaqs().then((value) => update());

  }
  Future getfaqs()async{
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? language= prefs.get('lang2').toString();
      var url = Uri.parse(baseURL+'/faqs');
      var respone=await http.get(url,headers: {
        'lang':(language!='ar')?'en':'ar',

      });
      var responebody=jsonDecode(respone.body)['data']['data'];
      print('responebody:>>>>>$responebody');
      print(respone.statusCode);

      for(int i= 0; i < responebody.length; i++)
      {
        fqa.add(fqamodel.fromMap(responebody[i]));
      }
    }catch(e){
      print('error=<<<<<$e');
    }

  }

}
