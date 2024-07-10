import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_ease/model/learn_item.dart';

class LearnEaseController {
  final String baseUrl = 'http://192.168.8.101:3000/api/learnEase/';

  Future<List<LearnItem>> fetchItem() async {
    final Response = await http.get(Uri.parse(baseUrl));
    if (Response.statusCode == 200) {
      List jsonResponse = jsonDecode(Response.body);
      return jsonResponse.map((item) => LearnItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed load LearnItem');
    }
  }

  Future<LearnItem> addData(LearnItem item) async {
    final response = await http.post(Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(item.toJson()));
    if (response.statusCode == 201) {
      print(LearnItem.fromJson(jsonDecode(response.body)));
      return LearnItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('failed post data');
    }
  }
}
