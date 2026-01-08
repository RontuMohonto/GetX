import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AddToCartController {
  Future<void> addtocart({required int id,required int qty}) async {
    try {
      FlutterSecureStorage _storage = FlutterSecureStorage();
      var t = await _storage.read(key: "token");
      Uri url = Uri.parse("https://eplay.coderangon.com/api/cart");
      var header = {
        "Accept": "application/json",
        "Content-type": "appliction/json",
        "Authorization": "Bearer $t",
      };
      var body = {"product_id": id, "quantity": qty};
      var response = await http.post(url, body: jsonEncode(body), headers: header);
      if (response.statusCode == 200) {
        EasyLoading.showSuccess("Added to cart");
        return;
      } else if (response.statusCode == 401) {
        EasyLoading.showError("Login First");
      }
    } catch (e) {
      log("Error : $e");
    }
  }
}
