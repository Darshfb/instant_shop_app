import 'package:get/get.dart';
import 'package:softagi/controller/AppLanguage/langs/ar.dart';
import 'package:softagi/controller/AppLanguage/langs/en.dart';


class Translation extends Translations
{
  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
  };

}