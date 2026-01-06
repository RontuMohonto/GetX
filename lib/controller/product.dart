import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class productservice {
  Future<Map> getdata() async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/products");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
    } catch (e) {
      log("=====Error : $e=====");
    }
    return {};
  }
}
