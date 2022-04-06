import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/user_model.dart';

class MainPageController extends GetxController {
  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  final _users = <User>[].obs;

  List<User> get users => _users;
  set users(val) => _users.value = val;

  final _hasReachedMax = false.obs;
  bool get hasReachedMax => _hasReachedMax.value;
  set hasReachedMax(val) => _hasReachedMax.value = val;

  final _searchedUsers = <User>[].obs;

  List<User> get searchedUsers => _searchedUsers;
  set searchedUsers(val) => _searchedUsers.value = val;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  final _isSearch = false.obs;
  bool get isSearch => _isSearch.value;
  set isSearch(val) => _isSearch.value = val;

  TextEditingController searchController = TextEditingController();

  //Get User
  getUser([int startIndex = 0]) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_USER";
      map['startIndex'] = startIndex.toString();
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_user.php"),
          body: map);
      print('Get User Response : ${response.body}');
      if (200 == response.statusCode) {
        if (response.body == "errors") {
          hasReachedMax = true;
        }
        users.addAll(parseResponse(response.body));
        isLoading = true;
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
