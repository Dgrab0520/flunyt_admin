import 'package:flunyt_admin/admin/ui/review_page/review_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../main_page/main_page.dart';
import '../setting_page/setting_page.dart';

late Widget top;

class PartnerPage extends StatefulWidget {
  const PartnerPage({Key? key}) : super(key: key);

  @override
  _PartnerPageState createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  bool _isLoading1 = false;
  bool _isLoading2 = false;
  bool _isLoading3 = false;
  String strYear = '';
  String strMonth = '';

  bool isSearch = false;

  TextEditingController searchController = TextEditingController();

  selectPro(pro_id) {
    Get.defaultDialog(
        title: '파트너 상세 정보',
        titleStyle: TextStyle(
          fontSize: 14.0,
          fontFamily: 'NanumSquareB',
        ),
        radius: 5.0,
        content: Container(
          width: Get.width * 0.5,
          height: Get.height * 0.45,
          padding: EdgeInsets.symmetric(vertical: 15.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '아이디',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '|  pro_id',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '담당자 명',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '|  pro_name',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '담당자 연락처',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '|  pro_phone',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '회사 명',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '|  com_name',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '사업자 번호',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '|  com_no',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          flex: 3,
                          child: Text(
                            '가입일',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            '|  register_date',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'NanumSquareR',
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                      child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        width: 120,
                        height: 35.0,
                        decoration: BoxDecoration(
                            color: Color(0xff506AB4),
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                            child: Text(
                          '확인',
                          style: TextStyle(fontSize: 14.0, color: Colors.white),
                        ))),
                  ))
                ],
              );
            },
          ),
        ));
  }

  //기준 년/월 불러오기
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd / EE');

    strMonth = formatter.format(now).split("-")[1];
    strYear = formatter.format(now).split("-")[0];
    print('This Month : $strMonth');
    return strMonth;
  }

  @override
  void initState() {
    super.initState();
    getToday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 30,
                  right: MediaQuery.of(context).size.width / 30,
                  top: MediaQuery.of(context).size.width / 70,
                  bottom: MediaQuery.of(context).size.width / 70),
              color: Color(0xff506AB4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(MainPage());
                    },
                    child: Text(
                      '관리자 페이지',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                flex: 9,
                child: MediaQuery.of(context).size.width < 1500
                    ? Column(
                        children: [
                          //Header
                          Container(
                            width: Get.width,
                            height: 60,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            color: Color(0xFF3B4E84),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(MainPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top: 1, bottom: 1),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '인플루언서 관리',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '업체 관리',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(ReviewPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '리뷰 관리',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(SettingPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '통계&설정',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          //Page Title
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                              top: MediaQuery.of(context).size.width / 70,
                              bottom: MediaQuery.of(context).size.width / 70,
                            ),
                            child: Text(
                              '업체 관리',
                              style: TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize: 18,
                              ),
                            ),
                          ),

                          //Summary Header
                          Container(
                              width: Get.width,
                              padding: EdgeInsets.only(
                                left: Get.width / 30,
                                right: Get.width / 30,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Text(
                                        '요약 정보',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFeeeeee),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFFcccccc))),
                                          child: Center(
                                            child: Text(
                                              '기준 일자',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '전체 업체 수',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '전체 캠페인 진행 수',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '전체 캠페인 완료 수',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),

                          //Summary Body
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(
                              left: Get.width / 30,
                              right: Get.width / 30,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        left: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$strYear년 $strMonth월',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'all_partner 명',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'alii_partner 건',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'pay_count 건',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30),
                            child: Divider(
                              height: 0.0,
                              thickness: 1.0,
                              color: Color(0xFFe6e6e6),
                            ),
                          ),

                          SizedBox(height: 30),

                          //Search
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 30,
                                  ),
                                  Icon(Icons.arrow_right),
                                  Text(
                                    '전체 정보',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 180,
                                  margin:
                                      EdgeInsets.only(right: Get.width / 30),
                                  child: TextField(
                                    controller: searchController,
                                    onSubmitted: (text) {
                                      // //검색
                                      // searchResult = [];
                                      // print(text);
                                      // searchResult.addAll(detail.where(
                                      //     (element) =>
                                      //         element.com_name.contains(text)));
                                      // setState(() {
                                      //   isSearch = true;
                                      // });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      fillColor:
                                          Color(0xFF2A2D3E).withOpacity(0.1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          // //검색
                                          // searchResult = [];
                                          // print(searchController.text);
                                          // searchResult.addAll(detail.where(
                                          //     (element) => element.com_name
                                          //         .contains(
                                          //             searchController.text)));
                                          // print(searchResult);
                                          // setState(() {
                                          //   isSearch = true;
                                          // });
                                        },
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2697FF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.search,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 40),

                          //Table Head
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFeeeeee),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFFcccccc))),
                                    child: Center(
                                      child: Text(
                                        '번호',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '아이디',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '담당자명',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '연락처',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '회사명',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '사업자번호',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '가입일',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '관리',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Table Body
                          _isLoading2
                              ? Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                30,
                                        right:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ),
                                      child: isSearch
                                          ? ListView.builder(
                                              itemCount: 5,
                                              itemBuilder: (_, int index) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            left: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${index + 1}',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "pro_id",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "pro_phone",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "com_name",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "com_no",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "제휴 파트너",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "register_date",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '삭제',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '상세',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })
                                          : ListView.builder(
                                              itemCount: 5,
                                              itemBuilder: (_, int index) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            left: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${index + 1}',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'pro_id',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '율유류',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'pro_phone',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'com_name',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'com_no',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'register_date',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '삭제',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '상세',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })))
                              : Container(),

                          SizedBox(height: 40.0)
                        ],
                      )
                    : Column(
                        children: [
                          //Header
                          Container(
                            width: Get.width,
                            height: 60,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            color: Color(0xFF3B4E84),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(MainPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top: 1, bottom: 1),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '인플루언서 관리',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '업체 관리',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(ReviewPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '리뷰 관리',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.to(SettingPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '통계&설정',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'NanumSquareR',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20),

                          //Page Title
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.1,
                              vertical: 35.0,
                            ),
                            child: Text(
                              '업체 관리',
                              style: TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize: 18,
                              ),
                            ),
                          ),

                          //Summary Header
                          Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.1),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Text(
                                        '요약 정보',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFeeeeee),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFFcccccc))),
                                          child: Center(
                                            child: Text(
                                              '기준 일자',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '전체 업체 수',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$strMonth월 캠페인 진행 수',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide(
                                                // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '$strMonth월 캠페인 완료 수',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),

                          //Summary Body
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        left: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$strYear년 $strMonth월',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'all_partner 명',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'alii_partner 건',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'pay_count 건',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30),

                          SizedBox(
                            width: Get.width * 0.8,
                            child: Divider(
                              height: 0.0,
                              thickness: 1.0,
                              color: Color(0xFFe6e6e6),
                            ),
                          ),

                          SizedBox(height: 30),

                          //Search
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.1,
                                  ),
                                  Icon(Icons.arrow_right),
                                  Text(
                                    '전체 정보',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 180,
                                  margin:
                                      EdgeInsets.only(right: Get.width * 0.1),
                                  child: TextField(
                                    controller: searchController,
                                    onSubmitted: (text) {
                                      // //검색
                                      // searchResult = [];
                                      // print(text);
                                      // searchResult.addAll(detail.where(
                                      //     (element) =>
                                      //         element.com_name.contains(text)));
                                      // setState(() {
                                      //   isSearch = true;
                                      // });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      fillColor:
                                          Color(0xFF2A2D3E).withOpacity(0.1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {
                                          // //검색
                                          // searchResult = [];
                                          // print(searchController.text);
                                          // searchResult.addAll(detail.where(
                                          //     (element) => element.com_name
                                          //         .contains(
                                          //             searchController.text)));
                                          // print(searchResult);
                                          // setState(() {
                                          //   isSearch = true;
                                          // });
                                        },
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2697FF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Icon(
                                            CupertinoIcons.search,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 40),

                          //Table Head
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.1),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFeeeeee),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFFcccccc))),
                                    child: Center(
                                      child: Text(
                                        '번호',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '아이디',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '담당자명',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '연락처',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '회사명',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '사업자번호',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '가입일',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide(
                                          // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '관리',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //Teabe Body
                          _isLoading2
                              ? Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.1),
                                      child: isSearch
                                          ? ListView.builder(
                                              itemCount: 5,
                                              itemBuilder: (_, int index) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            left: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${index + 1}',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "pro_id",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "pro_phone",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "com_name",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "com_no",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "제휴 파트너",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            "register_date",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '삭제',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '상세',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })
                                          : ListView.builder(
                                              itemCount: 5,
                                              itemBuilder: (_, int index) {
                                                return Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            left: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${index + 1}',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'pro_id',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '율유류',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'pro_phone',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'com_name',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'com_no',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'register_date',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  'NanumSquareR',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border(
                                                            right: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                            bottom: BorderSide(
                                                              // POINT
                                                              color: Color(
                                                                  0xFFcccccc),
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '삭제',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 10),
                                                              Expanded(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    height: 25,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5),
                                                                        color: Color(
                                                                            0xFF656565)),
                                                                    child: Center(
                                                                        child: Text(
                                                                      '상세',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    )),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              })))
                              : Container(),

                          SizedBox(height: 10.0)
                        ],
                      )),
          ],
        ),
      )),
    );
  }
}
