import 'dart:convert';

import 'package:flunyt_admin/admin/model/main_summary_model.dart';
import 'package:flunyt_admin/admin/model/user_auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/user_model.dart';

class MainPageController extends GetxController {
  @override
  void onInit() {
    getSummary();
    getUser();
    super.onInit();
  }

  final _users = <User>[].obs;

  List<User> get users => _users;
  set users(val) => _users.value = val;

  final _userAuth = <UserAuth>[].obs;
  List<UserAuth> get userAuth => _userAuth;
  set userAuth(val) => _userAuth.value = val;

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

  final _mainSummary = MainSummary(
          allUserCount: "allUserCount",
          monthJoinCount: "monthJoinCount",
          monthCampaignCount: "monthCampaignCount")
      .obs;
  MainSummary get mainSummary => _mainSummary.value;
  set mainSummary(val) => _mainSummary.value = val;

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

  //Get Summary
  getSummary() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_SUMMARY";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_user.php"),
          body: map);
      print('Get Summary Response : ${response.body}');
      if (200 == response.statusCode) {
        var json = jsonDecode(response.body);
        print("json : $json");
        mainSummary = MainSummary.fromJson(json);
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //Get Auth
  getUserAuth() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_AUTH";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_user.php"),
          body: map);
      print('Get Auth Response : ${response.body}');
      if (200 == response.statusCode) {
        userAuth = parseSNSResponse(response.body);
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

  //모든 sns 인증 불러오기
  static List<UserAuth> parseSNSResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserAuth>((json) => UserAuth.fromJson(json)).toList();
  }
}
