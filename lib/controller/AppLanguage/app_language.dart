import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softagi/controller/AppLanguage/local_storage.dart';
class AppLanguage extends GetxController{
var appLocale = 'en';

  @override
  Future<void> onInit() async {
    super.onInit();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang1', appLocale);
    LocalStorage localStorage = LocalStorage();
    appLocale = await localStorage.languageSelected==null ? 'en' :  await localStorage.languageSelected;
    Get.updateLocale(Locale(appLocale));
    update();
  }
  void changeLanguage(String type) async
  {

    LocalStorage localStorage = LocalStorage();
    if(appLocale == type){
      return;
    }
    if(type == 'ar'){
      appLocale = 'ar';
      localStorage.saveLangaugeToDisk('ar');
    } else{
      appLocale = 'en';
      localStorage.saveLangaugeToDisk('en');
    }

    update();
  }
}