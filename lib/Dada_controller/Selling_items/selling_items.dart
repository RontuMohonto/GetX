import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SellingItemsController {
  Future<Map> getSellingsItemsData() async {
    try {
      Uri url = Uri.parse("https://eplay.coderangon.com/api/home-products");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['data'];
      }
    } catch (e) {
      log("====Error : $e========");
    }
    return {};
  }
}
