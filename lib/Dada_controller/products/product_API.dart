import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

class GetProductController {
  Future<List> getProduct({required String id}) async {
    try {
      Uri url;
      if (id == 'hot-selling') {
        url = Uri.parse("https://eplay.coderangon.com/api/products");
      } else if (id == 'latest') {
        url = Uri.parse("https://eplay.coderangon.com/api/products/latests");
      } else {
        url = Uri.parse("https://eplay.coderangon.com/api/products/category/$id");
      }
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        return jsonData['data'];
      } else {
        EasyLoading.showError("Something went wrong");
      }
    } catch (e) {
      log("=====Error : $e====");
    }
    return [];
  }
}
