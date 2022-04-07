import 'dart:convert';

import 'package:flunyt_admin/admin/model/review_summary_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/review_model.dart';

class ReviewPageController extends GetxController {
  @override
  void onInit() {
    getSummary();
    getReview();
    super.onInit();
  }

  final _reviews = <Review>[].obs;

  List<Review> get reviews => _reviews;
  set reviews(val) => _reviews.value = val;

  final _hasReachedMax = false.obs;
  bool get hasReachedMax => _hasReachedMax.value;
  set hasReachedMax(val) => _hasReachedMax.value = val;

  final _searchedReviews = <Review>[].obs;

  List<Review> get searchedReviews => _searchedReviews;
  set searchedReviews(val) => _searchedReviews.value = val;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  final _isSearch = false.obs;

  bool get isSearch => _isSearch.value;
  set isSearch(val) => _isSearch.value = val;

  final _reviewSummary = ReviewSummary(
          allReviewCount: "allReviewCount",
          monthReviewCount: 0,
          firstDate: DateTime.now())
      .obs;
  ReviewSummary get reviewSummary => _reviewSummary.value;
  set reviewSummary(val) => _reviewSummary.value = val;

  TextEditingController searchController = TextEditingController();

  //Get Review
  getReview([int startIndex = 0]) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_REVIEW";
      map['startIndex'] = startIndex.toString();
      final response = await http.post(
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_review.php"),
          body: map);
      print('Get Review Response : ${response.body}');
      if (200 == response.statusCode) {
        if (response.body == "error") {
          hasReachedMax = true;
        }
        reviews.addAll(parseResponse(response.body));
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
          Uri.parse("$kBaseUrl/web_data/flunyt_admin_review.php"),
          body: map);
      print('Get Summary Response : ${response.body}');
      if (200 == response.statusCode) {
        var json = jsonDecode(response.body);
        print("json : $json");
        reviewSummary = ReviewSummary.fromJson(json);
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
