import 'dart:convert';

import 'package:http/http.dart' as https;
import 'package:suitmedia_mobiledev_2024/models/user_model.dart';

class UserService {
  static var client = https.Client();

  static Future<List<Datum>> getUsers(String? page) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
    };

    var url = Uri.https("reqres.in", "/api/users", {"page": page});
    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      print("Berhasil get users ${response.body}");
      var dataList = userListFromJson(response.body);
      return dataList;
    } else {
      print("Gagal get users ${response.body}");
      throw Exception('Failed to load users');
    }
  }
}

List<Datum> userListFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Datum>.from(jsonData["data"].map((x) => Datum.fromJson(x)));
}
