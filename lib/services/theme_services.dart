import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeServices  {
  // save a value

   final  _box = GetStorage();
  final _key = 'isDarkMode';

// حفظ قيمه
  _saveThemeToBox(bool isDarkMode)=>_box.write(_key, isDarkMode) ;

// نقوم بقراءه قيم معينه
  bool _loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    // كل مره تغير السيم
    Get.changeThemeMode(_loadThemeFromBox()?ThemeMode.light : ThemeMode.dark);
// القيمه الجديده تحتفط هنا
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
