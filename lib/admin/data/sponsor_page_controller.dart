import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flunyt_admin/admin/model/sponsor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants.dart';
import '../model/sponsor_summary_model.dart';

class SponsorPageController extends GetxController {
  @override
  void onInit() {
    getSummary();
    getSponsor();
    super.onInit();
  }

  final _sponsors = <Sponsor>[].obs;

  List<Sponsor> get sponsors => _sponsors;
  set sponsors(val) => _sponsors.value = val;

  final _searchedSponsors = <Sponsor>[].obs;

  List<Sponsor> get searchedSponsors => _searchedSponsors;
  set searchedSponsors(val) => _searchedSponsors.value = val;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  final _isSearch = false.obs;
  bool get isSearch => _isSearch.value;
  set isSearch(val) => _isSearch.value = val;

  final _sponsorSummary = SponsorSummary(
          allSponsorCount: "allSponsorCount",
          monthSponsorCount: "monthSponsorCount",
          completeSponsorCount: "completeSponsorCount")
      .obs;
  SponsorSummary get sponsorSummary => _sponsorSummary.value;
  set sponsorSummary(val) => _sponsorSummary.value = val;

  TextEditingController searchController = TextEditingController();

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  //Get Partner
  getSponsor() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_SPONSOR";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_sponsor.php"),
          body: map);
      print('Get Sponsor Response : ${response.body}');
      if (200 == response.statusCode) {
        sponsors = parseResponse(response.body);
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
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_sponsor.php"),
          body: map);
      print('Get Summary Response : ${response.body}');
      if (200 == response.statusCode) {
        var json = jsonDecode(response.body);
        print("json : $json");
        sponsorSummary = SponsorSummary.fromJson(json);
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //스폰서 추가
  Future<bool> insertSponsor(
      Sponsor sponsor, Uint8List? thumb, Uint8List? content) async {
    String sponsorId = getRandomString();
    try {
      var url = Uri.parse("$kBaseUrl/web_data/flunyt_admin_sponsor.php");
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "SPONSOR_INSERT";
      request.fields['sponsorId'] = sponsorId;
      request.fields['status'] = sponsor.status;
      request.fields['title'] = sponsor.title;
      request.fields['content'] = sponsor.content;
      request.fields['area'] = sponsor.area;
      request.fields['serviceType'] = sponsor.serviceType;
      request.fields['image'] = sponsorId + ".gif";

      request.files.add(http.MultipartFile.fromBytes(
        "thumb",
        thumb!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "thumb",
      ));
      request.files.add(http.MultipartFile.fromBytes(
        "content",
        content!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "content",
      ));
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Insert Sponsor Response : ${response.body}");
      if (response.statusCode == 200) {
        if (response.body == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("exception : $e");
      return false;
    }
  }

  //스폰서 삭제
  static Future<bool> deleteSponsor(int sponsorId) async {
    try {
      var url = Uri.parse("$kBaseUrl/web_data/flunyt_admin_sponsor.php");
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "SPONSOR_DELETE";
      request.fields['id'] = sponsorId.toString();

      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Delete Main Banner Response : ${response.body}");
      if (response.statusCode == 200) {
        if (response.body == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("exception : $e");
      return false;
    }
  }

  //메인 배너 업데이트
  Future<bool> updateMainBanner(
      {String? id,
      String? title,
      String? content,
      required String status,
      Uint8List? contentImage}) async {
    try {
      var url = Uri.parse("$kBaseUrl/web_data/flunyt_admin_sponsor.php");
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "SPONSOR_UPDATE";
      request.fields['id'] = id ?? "";
      request.fields['title'] = title ?? "";
      request.fields['content'] = content ?? "";
      request.fields['status'] = status;

      if (contentImage != null) {
        request.fields['banner_image'] = getRandomString() + '.gif';
        request.files.add(http.MultipartFile.fromBytes(
          "userFile",
          contentImage,
          contentType: MediaType('application', 'octet-stream'),
          filename: "userFile",
        ));
      }
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Update Main Banner Response : ${response.body}");
      if (response.statusCode == 200) {
        if (response.body == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("exception : $e");
      return false;
    }
  }

  //모든 거래 목록 불러오기
  static List<Sponsor> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Sponsor>((json) => Sponsor.fromJson(json)).toList();
  }
}
