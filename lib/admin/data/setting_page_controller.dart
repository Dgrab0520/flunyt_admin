import 'dart:convert';

import 'package:flunyt_admin/admin/model/data_list_model.dart';
import 'package:flunyt_admin/admin/model/top_category_model.dart';
import 'package:flunyt_admin/admin/model/top_saved_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/month_count_model.dart';
import '../model/user_total_model.dart';

class SettingPageController extends GetxController {
  @override
  void onInit() {
    getArea();
    getService();
    super.onInit();
  }

  final _areaList = <DataRow>[].obs; //지역 현황 리스트
  final _categoryList = <DataRow>[].obs; //카테고리 현황 리스트

  List<DataRow> get areaList => _areaList;
  set areaList(val) => _areaList.value = val;

  List<DataRow> get categoryList => _categoryList;
  set categoryList(val) => _categoryList.value = val;

  final _isAreaLoading = false.obs;
  bool get isAreaLoading => _isAreaLoading.value;
  set isAreaLoading(val) => _isAreaLoading.value = val;

  final _isCategoryLoading = false.obs;
  bool get isCategoryLoading => _isCategoryLoading.value;
  set isCategoryLoading(val) => _isCategoryLoading.value = val;

  final _monthList = <MonthCount>[].obs;
  List<MonthCount> get monthList => _monthList;
  set monthList(val) => _monthList.value = val;

  final _isMonthLoading = false.obs;
  bool get isMonthLoading => _isMonthLoading.value;
  set isMonthLoading(val) => _isMonthLoading.value = val;

  final _userList = <UserTotal>[].obs;
  List<UserTotal> get userList => _userList;
  set userList(val) => _userList.value = val;

  final _topCategory = <TopCategoryModel>[].obs;
  List<TopCategoryModel> get topCategory => _topCategory;
  set topCategory(val) => _topCategory.value = val;

  final _topSaved = <TopSavedModel>[].obs;
  List<TopSavedModel> get topSaved => _topSaved;
  set topSaved(val) => _topSaved.value = val;

  //Get Area
  getArea() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_AREA";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_setting.php"),
          body: map);
      print('Get Area Response : ${response.body}');
      if (200 == response.statusCode) {
        List<DataList> dataList = parseResponse(response.body);

        areaList = List.generate(
          //서비스 현황 리스트 초기화
          dataList.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(dataList[index].keyword)),
              DataCell(Center(
                child: Text('${dataList[index].count} 건'),
              )),
            ],
          ),
        );
        isAreaLoading = true;
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //Get Area
  getService() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_SERVICE";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_setting.php"),
          body: map);
      print('Get Area Response : ${response.body}');
      if (200 == response.statusCode) {
        List<DataList> dataList = parseResponse(response.body);

        categoryList = List.generate(
          //서비스 현황 리스트 초기화
          dataList.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(dataList[index].keyword)),
              DataCell(Center(
                child: Text('${dataList[index].count} 건'),
              )),
            ],
          ),
        );
        isCategoryLoading = true;
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //Get Month Count
  Future<bool> getMonthCount() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_MONTH";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_setting.php"),
          body: map);
      print('Get Month Response : ${response.body}');
      if (200 == response.statusCode) {
        monthList = parseMonthResponse(response.body);
        isMonthLoading = true;
        return true;
      }
    } catch (e) {
      print("exception : $e");
    }
    return false;
  }

  //Get User Total
  Future<bool> getUserTotal() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_USER_TOTAL";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_setting.php"),
          body: map);
      print('Get User Total Response : ${response.body}');
      if (200 == response.statusCode) {
        userList = parseUserResponse(response.body);
        return true;
      }
    } catch (e) {
      print("exception : $e");
    }
    return false;
  }

  //Get Top Category
  Future<bool> getTopCategory() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_TOP_CATEGORY";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_setting.php"),
          body: map);
      print('Get Top Category Response : ${response.body}');
      if (200 == response.statusCode) {
        topCategory = parseCategoryResponse(response.body);
        return true;
      }
    } catch (e) {
      print("exception : $e");
    }
    return false;
  }

  //Get Top Saved
  Future<bool> getTopSaved() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_TOP_SAVED";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_setting.php"),
          body: map);
      print('Get Top Saved Response : ${response.body}');
      if (200 == response.statusCode) {
        topSaved = parseSavedResponse(response.body);
        return true;
      }
    } catch (e) {
      print("exception : $e");
    }
    return false;
  }

  //지역, 카테고리 이용 현황
  static List<DataList> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<DataList>((json) => DataList.fromJson(json)).toList();
  }

  //월별 이용 현황
  static List<MonthCount> parseMonthResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MonthCount>((json) => MonthCount.fromJson(json)).toList();
  }

  //전체 인플루언서 현황
  static List<UserTotal> parseUserResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserTotal>((json) => UserTotal.fromJson(json)).toList();
  }

  //Top 5 카테고리 현황
  static List<TopCategoryModel> parseCategoryResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<TopCategoryModel>((json) => TopCategoryModel.fromJson(json))
        .toList();
  }

  //Top 5 저장된 장소 현황
  static List<TopSavedModel> parseSavedResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<TopSavedModel>((json) => TopSavedModel.fromJson(json))
        .toList();
  }
}
