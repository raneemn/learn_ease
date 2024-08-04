import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_ease/model/userInterest.dart';

class UserInterestController {
  final String baseUrl = 'http://192.168.8.101:3000/api/userInterest/';

  Future<List<UserInterest>> fetchItem() async {
    final Response = await http.get(Uri.parse(baseUrl));
    if (Response.statusCode == 200) {
      List jsonResponse = jsonDecode(Response.body);

      return jsonResponse.map((item) => UserInterest.fromJson(item)).toList();
    } else {
      throw Exception('Failed load LearnItem');
    }
  }

  Future<UserInterest> addData(dynamic item) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(item.toJson()));
    if (response.statusCode == 201) {
      print(UserInterest.fromJson(jsonDecode(response.body)));
      return UserInterest.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed post data');
    }
  }

  Future updateData(
      String id, String userName, String interest, String disc) async {
    final response = await http.put(Uri.parse(baseUrl + '$id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            {'userName': userName, 'description': disc, 'interest': interest}));
    if (response.statusCode == 200) {
      print(jsonEncode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('failed update data');
    }
  }

  Future<bool> deleteInterest(String id) async {
    final response = await http.delete(Uri.parse(baseUrl + '$id'), headers: {
      'Content-Type': 'application/json',
    });
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    } else {
      return false;
    }
  }
}
