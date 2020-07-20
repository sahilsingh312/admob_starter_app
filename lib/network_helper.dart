import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url = 'https://api.exchangeratesapi.io//2018-03-26';

  Future<Map> latestMap(String date) async {
    http.Response response =
        await http.get('https://api.exchangeratesapi.io/' + date);
    if (response.statusCode == 200) {
      print("response 200");
    }
    Map<String, dynamic> allCurrenciesMap = jsonDecode(response.body);
    return allCurrenciesMap;
  }
}
