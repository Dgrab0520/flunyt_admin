import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/user_model.dart';

class SettingPageController extends GetxController {
  List<DataRow> areaList = []; //지역 현황 리스트
  List<DataRow> categoryList = []; //카테고리 현황 리스트

  //Get User
  getUser() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_USER";
      final response = await http.post(
          Uri.parse("$baseUrl/web_data/flunyt_admin_user.php"),
          body: map);
      print('Get User Response : ${response.body}');
      if (200 == response.statusCode) {
        //users = parseResponse(response.body);
        //isLoading = true;
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //모든 거래 목록 불러오기
  static List<User> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}
