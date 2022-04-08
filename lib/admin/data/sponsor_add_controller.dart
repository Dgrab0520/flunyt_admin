import 'dart:math';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../../constants.dart';
import '../model/sponsor_model.dart';

class SponsorAddController extends GetxController {
  @override
  void onInit() {
    sponsorInit();
    super.onInit();
  }

  final _areaList = {
    "하남": true,
    "강동": false,
    "송파": false,
  }.obs;
  Map<String, bool> get areaList => _areaList;
  set areaList(val) => _areaList.value = val;
  //지역 카테고리
  final _serviceList = {
    "카페": true,
    "맛집": false,
    "헤어샵": false,
    "네일샵": false,
    "전자제품": false,
    "도서": false,
    "공방": false,
  }.obs;
  Map<String, bool> get serviceList => _serviceList;
  set serviceList(val) => _serviceList.value = val;
  //서비스 카테고리

  final _selectedArea = "하남".obs;
  get selectedArea => _selectedArea.value;
  set selectedArea(val) => _selectedArea.value = val;

  final _selectedService = "카페".obs;
  get selectedService => _selectedService.value;
  set selectedService(val) => _selectedService.value = val;

  sponsorInit() {
    selectedService = "카페";
    selectedArea = "하남";
    areaList = {
      "하남": true,
      "강동": false,
      "송파": false,
    };
    serviceList = {
      "카페": true,
      "맛집": false,
      "헤어샵": false,
      "네일샵": false,
      "전자제품": false,
      "도서": false,
      "공방": false,
    };
  }

  selectArea(String area) {
    areaList.updateAll((key, value) => false);
    areaList[area] = true;
    selectedArea = area;
    _areaList.refresh();
    print(areaList);
  }

  selectService(String service) {
    serviceList.updateAll((key, value) => false);
    serviceList[service] = true;
    selectedService = service;
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

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
      request.fields['area'] = selectedArea;
      request.fields['serviceType'] = selectedService;
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
}
