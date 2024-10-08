import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static String notificationURL = "http://localhost:3000/api/";

  static Future<http.Response> sendPost(String path, Object body) async {
    return await http.post(
      Uri.parse("$notificationURL/$path"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(body),
    );
  }
}
