import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CartGetController {
  Future<List> getdata() async {
    FlutterSecureStorage _storage = FlutterSecureStorage();
    var t = await _storage.read(key: "token");
    try {
      log("==0000000=");
      Uri url = Uri.parse("https://eplay.coderangon.com/api/cart");
      log("==1111111=");
      var header = {
        "Accept": "application/json",
        "Content-type": "appliction/json",
        "Authorization": "Bearer $t",
      };
      var response = await http.get(url, headers: header);
      log("=======22222222222222====");

      log("===${response.statusCode}  ${response.body}======");
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      } else if (response.statusCode == 401) {
        EasyLoading.showError("Login first");
        return [];
      }
    } catch (e) {
      log("= Error : $e===");
    }
    return [];
  }
}
