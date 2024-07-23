import 'package:learn_ease/model/userInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserinfoController {
  final String baseURL = 'http://192.168.8.101:3000/api/userInfo/';

//Get user info from server
  Future<List<userInfo>> fetchItem() async {
    final Response = await http.get(Uri.parse(baseURL));
    if (Response.statusCode == 200) {
      List jsonResponse = jsonDecode(Response.body);
      return jsonResponse.map((item) => userInfo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load user info');
    }
  }

//post user info to server
  Future<userInfo> addUserInfo(userInfo item) async {
    final Response = await http.post(Uri.parse(baseURL),
    headers: {
          'Content-Type': 'application/json',
        },
    body: jsonEncode(item.toJson()));

    if (Response.statusCode == 201) {
      print(userInfo.fromJson(jsonDecode(Response.body)));
      return userInfo.fromJson(jsonDecode(Response.body));
    } else {
      throw Exception('failed post data');
    }
  }
}
