import 'package:get_storage/get_storage.dart';

class LocalStorage
{
  void saveLangaugeToDisk(String language) async {
    await GetStorage().write('lang', language);
  }

  Future get languageSelected async{
    return await GetStorage().read('lang');
    
  }
}