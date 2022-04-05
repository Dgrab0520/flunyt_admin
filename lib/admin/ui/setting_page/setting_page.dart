import 'package:flunyt_admin/admin/ui/review_page/review_page.dart';
import 'package:flunyt_admin/admin/ui/setting_page/widget/big_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../partner_page.dart';
import '../main_page/main_page.dart';
import 'widget/small_screen.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFfD1D9E5),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30,
                top: MediaQuery.of(context).size.width / 70,
                bottom: MediaQuery.of(context).size.width / 70),
            color: const Color(0xff506AB4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: InkWell(
                  onTap: () {
                    Get.to(MainPage());
                  },
                  child: const Text(
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
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    height: 60,
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30,
                    ),
                    color: const Color(0xFF3B4E84),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(MainPage());
                          },
                          child: Container(
                            padding: MediaQuery.of(context).size.width > 1300
                                ? const EdgeInsets.all(10.0)
                                : const EdgeInsets.all(15.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3B4E84),
                            ),
                            child: const Center(
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
                          onTap: () {
                            Get.to(const PartnerPage());
                          },
                          child: Container(
                            padding: MediaQuery.of(context).size.width > 1300
                                ? const EdgeInsets.all(10.0)
                                : const EdgeInsets.all(15.0),
                            decoration: const BoxDecoration(
                              color: Color(0xFF3B4E84),
                            ),
                            child: const Center(
                              child: Text(
                                '업체 관리',
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
                            Get.to(const SettingPage());
                          },
                          child: Container(
                            padding: MediaQuery.of(context).size.width > 1300
                                ? const EdgeInsets.all(10.0)
                                : const EdgeInsets.all(15.0),
                            margin: const EdgeInsets.only(top: 1, bottom: 1),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: const Center(
                              child: Text(
                                '통계&설정',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'NanumSquareB',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  MediaQuery.of(context).size.width > 1300
                      ? BigScreen() //크기별 위젯 분리
                      : SmallScreen()
                ],
              )),
        ],
      )),
    );
  }
}
