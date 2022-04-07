import 'dart:convert';

import 'package:flunyt_admin/admin/model/partner_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/client_model.dart';

class PartnerController extends GetxController {
  @override
  void onInit() {
    getSummary();
    getPartner();
    super.onInit();
  }

  final _partners = <Client>[].obs;

  List<Client> get partners => _partners;
  set partners(val) => _partners.value = val;

  final _searchedPartners = <Client>[].obs;

  List<Client> get searchedPartners => _searchedPartners;
  set searchedPartners(val) => _searchedPartners.value = val;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  final _isSearch = false.obs;
  bool get isSearch => _isSearch.value;
  set isSearch(val) => _isSearch.value = val;

  final _partnerSummary = PartnerSummary(
          allClientCount: "allClientCount",
          monthCampaignCount: "monthCampaignCount",
          completeCampaignCount: "completeCampaignCount")
      .obs;
  PartnerSummary get partnerSummary => _partnerSummary.value;
  set partnerSummary(val) => _partnerSummary.value = val;

  TextEditingController searchController = TextEditingController();

  //Get Partner
  getPartner() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_PARTNER";
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_client.php"),
          body: map);
      print('Get Partner Response : ${response.body}');
      if (200 == response.statusCode) {
        partners = parseResponse(response.body);
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
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_client.php"),
          body: map);
      print('Get Summary Response : ${response.body}');
      if (200 == response.statusCode) {
        var json = jsonDecode(response.body);
        print("json : $json");
        partnerSummary = PartnerSummary.fromJson(json);
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //모든 거래 목록 불러오기
  static List<Client> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Client>((json) => Client.fromJson(json)).toList();
  }
}
