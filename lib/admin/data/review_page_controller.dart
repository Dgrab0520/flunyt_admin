import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/review_model.dart';

class ReviewPageController extends GetxController {
  @override
  void onInit() {
    getReview();
    super.onInit();
  }

  final _reviews = <Review>[].obs;

  List<Review> get reviews => _reviews;
  set reviews(val) => _reviews.value = val;

  final _searchedReviews = <Review>[].obs;

  List<Review> get searchedReviews => _searchedReviews;
  set searchedReviews(val) => _searchedReviews.value = val;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  final _isSearch = false.obs;

  bool get isSearch => _isSearch.value;
  set isSearch(val) => _isSearch.value = val;

  TextEditingController searchController = TextEditingController();

  //Get Review
  getReview() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW";
      final response = await http.post(
          Uri.parse("$baseUrl/web_data/flunyt_admin_review.php"),
          body: map);
      print('Get Review Response : ${response.body}');
      if (200 == response.statusCode) {
        reviews = parseResponse(response.body);
        isLoading = true;
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //모든 거래 목록 불러오기
  static List<Review> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Review>((json) => Review.fromJson(json)).toList();
  }
}
