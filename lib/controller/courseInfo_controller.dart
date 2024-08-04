import 'package:learn_ease/model/courseInfo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CourseinfoController {
  final String baseUrl = 'http://192.168.8.101:3000/api/courseInfo';

  //Get course info data from server
  Future<List<courseInfo>> getCourseInfo() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((item) => courseInfo.fromJson(item)).toList();
    } else {
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    }
  }
}
