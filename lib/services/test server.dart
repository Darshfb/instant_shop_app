import 'package:http/http.dart' as http;
import 'package:softagi/const.dart';
import 'package:softagi/model/test.dart';

class ApiService {
  static var client = http.Client();

  static Future<carttt> fetchProducts() async {
    var url = Uri.parse(
        baseURL+'/carts');
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jasonString = response.body;
      return productFromJson(jasonString);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return null!;
    }
  }
}