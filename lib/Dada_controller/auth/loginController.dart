import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LoginController {
  static Future<bool> login({
    required String phone,
    required String password,
  }) async {
    try {
      var body = {"phone": phone.toString(), "password": password};

      var headers = {"Accept": "application/json"};

      Uri url = Uri.parse("https://b4.coderangon.com/api/login"); //eplay of b4
      var response = await http.post(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        late FlutterSecureStorage _storage = FlutterSecureStorage();

        var data = jsonDecode(response.body)['token'];
        _storage.write(key: "token", value: data);
        log("===Token======${jsonDecode(response.body)['token']}=====");
        EasyLoading.showSuccess("Login Success");
        return true;
      } else if (response.statusCode == 422) {
        EasyLoading.showError("Invalid Details");
        return false;
        EasyLoading.dismiss();
      }
    } catch (e) {
      log("====== Error : $e ======");
    }
    return false;
  }
}
