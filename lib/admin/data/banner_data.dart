import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flunyt_admin/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../admin/model/main_banner_model.dart';
import '../model/sub_banner_model.dart';

class BannerData extends GetxController {
  static const root = "$baseUrl/web_data/flunyt_admin_banner.php";

  final _bannerMain = <MainBanner>[].obs; //메인 배너
  final _bannerSub = <SubBanner>[].obs; //서브 배너

  get bannerMain => _bannerMain;
  set bannerMain(val) => _bannerMain.value = val;

  get bannerSub => _bannerSub;
  set bannerSub(val) => _bannerSub.value = val;

  final _isMainLoading = false.obs;
  final _isSubLoading = false.obs;

  get isMainLoading => _isMainLoading.value;
  set isMainLoading(val) => _isMainLoading.value = val;

  get isSubLoading => _isSubLoading.value;
  set isSubLoading(val) => _isSubLoading.value = val;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  //메인 배너 불러오기
  getBannerMain() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "BANNER_SELECT";
      final response = await http.post(Uri.parse(root), body: map);
      print('Main Banner Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<MainBanner> list = parseResponse(response.body);
        bannerMain = list;
        isMainLoading = true;
        print("isMainLoading : $isMainLoading");
      }
    } catch (e) {
      print(e);
    }
  }

  //서브 배너 불러오기
  getBannerSub() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = "BANNER_SUB_ACTION";
      final response = await http.post(Uri.parse(root), body: map);
      print('Banner Sub Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<SubBanner> list = parseSubResponse(response.body);
        bannerSub = list;
        isSubLoading = true;
        print(isSubLoading);
      }
    } catch (e) {
      print(e);
    }
  }

  //메인 배너 추가
  Future<bool> insertMainBanner(MainBanner banner, Uint8List? uFile) async {
    String bannerId = getRandomString();
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "BANNER_INSERT_ACTION";
      request.fields['banner_id'] = bannerId;
      request.fields['banner_status'] = banner.bannerStatus;
      request.fields['banner_title'] = banner.bannerMainTitle;
      request.fields['banner_sub'] = banner.bannerSubTitle;
      request.fields['banner_image'] = bannerId + ".gif";

      request.files.add(http.MultipartFile.fromBytes(
        "userFile",
        uFile!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "userFile",
      ));
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Insert Banner Response : ${response.body}");
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

  //서브 배너 추가
  Future<bool> insertSubBanner(String bannerStatus, Uint8List? uFile) async {
    String bannerId = getRandomString();
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "BANNER_INSERT_ACTION";
      request.fields['banner_id'] = bannerId;
      request.fields['banner_status'] = bannerStatus;
      request.fields['banner_image'] = bannerId + ".gif";

      request.files.add(http.MultipartFile.fromBytes(
        "userFile",
        uFile!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "userFile",
      ));
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Insert Banner Response : ${response.body}");
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

  //메인 배너 삭제
  static Future<bool> deleteMainBanner(int mainBannerId) async {
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "BANNER_MAIN_DELETE_ACTION";
      request.fields['id'] = mainBannerId.toString();

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

  //메인 배너 삭제
  static Future<bool> deleteSubBanner(int subBannerId) async {
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "BANNER_SUB_DELETE_ACTION";
      request.fields['id'] = subBannerId.toString();

      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Delete Sub Banner Response : ${response.body}");
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

  // //배너 업데이트
  // static Future<bool> updateBanner(
  //     String banner_id, String banner_title, String banner_sub,
  //     {String? banner_img, Uint8List? ufile}) async {
  //   try {
  //     var url = Uri.parse(ROOT);
  //     var request = http.MultipartRequest('POST', url);
  //     request.fields['action'] = "BANNER_UPDATE_ACTION";
  //     request.fields['banner_id'] = banner_id;
  //     request.fields['banner_title'] = banner_title;
  //     request.fields['banner_sub'] = banner_sub;
  //
  //     if (ufile != null) {
  //       request.fields['banner_image'] = getRandomString() + '.gif';
  //       print(request.fields['banner_image']);
  //       request.files.add(http.MultipartFile.fromBytes(
  //         "userfile",
  //         ufile,
  //         contentType: MediaType('application', 'octet-stream'),
  //         filename: "userfile",
  //       ));
  //     }
  //     print(request);
  //     http.Response response =
  //         await http.Response.fromStream(await request.send());
  //     print("Update Banner Response : ${response.body}");
  //     if (response.statusCode == 200) {
  //       if (response.body == "success") {
  //         return true;
  //       } else {
  //         return false;
  //       }
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print("exception : $e");
  //     return false;
  //   }
  // }

  static List<MainBanner> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<MainBanner>((json) => MainBanner.fromJson(json)).toList();
  }

  static List<SubBanner> parseSubResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SubBanner>((json) => SubBanner.fromJson(json)).toList();
  }
}
