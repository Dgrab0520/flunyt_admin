import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/coupon_model.dart';

class CouponData {
  static const root = "$kBaseUrl/web_data/flunyt_admin_coupon.php";

  //Get Coupon
  static Future<List<Coupon>> getCoupon(String date) async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_ALL";
      final response = await http.post(Uri.parse(root), body: map);
      print("Get Coupon Response : ${response.body}");
      if (200 == response.statusCode) {
        List<Coupon> list = parseResponse(response.body);
        return list;
      } else {
        return <Coupon>[];
      }
    } catch (e) {
      return <Coupon>[];
    }
  }

  //Get Customer's Summary Information
  static List<Coupon> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Coupon>((json) => Coupon.fromJson(json)).toList();
  }
}
