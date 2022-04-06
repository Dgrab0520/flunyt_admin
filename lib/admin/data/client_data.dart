import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/client_model.dart';

class ClientData {
  static const root = "$kBaseUrl/web_data/flunyt_admin_client.php";

  //모든 채팅 목록 불러오기
  static Future<List<Client>> getClient() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_ALL";
      final response = await http.post(Uri.parse(root), body: map);
      print('Get Client Response : ${response.body}');
      if (200 == response.statusCode) {
        List<Client> list = parseResponse(response.body);
        return list;
      } else {
        return <Client>[];
      }
    } catch (e) {
      return <Client>[];
    }
  }

  //모든 채팅 목록 불러오기 & 채팅 자세히 불러오기
  static List<Client> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Client>((json) => Client.fromJson(json)).toList();
  }
}
