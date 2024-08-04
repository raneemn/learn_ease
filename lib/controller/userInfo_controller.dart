import 'package:learn_ease/model/userInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserinfoController {
  final String baseUrl = 'http://192.168.8.101:3000/api/userInfo';

//Get user info from server
  Future<List<userInfo>> getUserData() async {
    final Response = await http.get(Uri.parse(baseUrl));
    if (Response.statusCode == 200) {
      List jsonResponse = jsonDecode(Response.body);
      return jsonResponse.map((item) => userInfo.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load user info');
    }
  }

//post user info to server to register new user
  Future<bool> register(userInfo user) async {
    final response = await http.post(Uri.parse('$baseUrl/register/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 200) {
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }

// sign in user
  Future<bool> signIn(userInfo user) async {
    final response = await http.post(Uri.parse('$baseUrl/login/'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()));
    if (response.statusCode == 200) {
      String token = jsonDecode(response.body)['token'];
      return true;
    } else {
       print(response.statusCode);
      print(jsonEncode(response.body));
      return false;
    }
  }

  //update user password
  Future<bool> updatePassword(String id, String newPass) async {
    final response = await http.put(Uri.parse(baseUrl + '/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'password': newPass}));
    if (response.statusCode == 200) {
      print(jsonEncode(response.body));
      return true;
    } else {
       print(response.statusCode);
       print(jsonEncode(response.body));
      return false;
    }
  }
}
