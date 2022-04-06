import 'package:flunyt_admin/admin/ui/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/main_page_controller.dart';
import '../partner_page/partner_page.dart';
import '../review_page/review_page.dart';
import '../setting_page/setting_page.dart';
import '../sponsor_page/sponsor_page.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({Key? key, required this.currentPage}) : super(key: key);

  final String currentPage;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Get.find<MainPageController>().users.clear();
              Get.find<MainPageController>().getUser();
              Get.find<MainPageController>().hasReachedMax = false;
              Get.offAll(() => MainPage());
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              margin: currentPage == "인플루언서 관리"
                  ? const EdgeInsets.only(top: 1, bottom: 1)
                  : null,
              color: currentPage == "인플루언서 관리"
                  ? Colors.white
                  : const Color(0xFF3B4E84),
              child: Center(
                child: Text(
                  '인플루언서 관리',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NanumSquareR',
                    color:
                        currentPage == "인플루언서 관리" ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => PartnerPage());
            },
            child: Container(
              padding: const EdgeInsets.all(7.0),
              margin: currentPage == "업체 관리"
                  ? const EdgeInsets.only(top: 1, bottom: 1)
                  : null,
              color: currentPage == "업체 관리"
                  ? Colors.white
                  : const Color(0xFF3B4E84),
              child: Center(
                child: Text(
                  '업체 관리',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NanumSquareR',
                    color: currentPage == "업체 관리" ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => ReviewPage());
            },
            child: Container(
              padding: const EdgeInsets.all(7.0),
              margin: currentPage == "리뷰 관리"
                  ? const EdgeInsets.only(top: 1, bottom: 1)
                  : null,
              color: currentPage == "리뷰 관리"
                  ? Colors.white
                  : const Color(0xFF3B4E84),
              child: Center(
                child: Text(
                  '리뷰 관리',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NanumSquareR',
                    color: currentPage == "리뷰 관리" ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => SponsorPage());
            },
            child: Container(
              padding: const EdgeInsets.all(7.0),
              margin: currentPage == "스폰서 관리"
                  ? const EdgeInsets.only(top: 1, bottom: 1)
                  : null,
              color: currentPage == "스폰서 관리"
                  ? Colors.white
                  : const Color(0xFF3B4E84),
              child: Center(
                child: Text(
                  '스폰서 관리',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NanumSquareR',
                    color:
                        currentPage == "스폰서 관리" ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.offAll(() => SettingPage());
            },
            child: Container(
              padding: const EdgeInsets.all(7.0),
              margin: currentPage == "통계&설정"
                  ? const EdgeInsets.only(top: 1, bottom: 1)
                  : null,
              color: currentPage == "통계&설정"
                  ? Colors.white
                  : const Color(0xFF3B4E84),
              child: Center(
                child: Text(
                  '통계&설정',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NanumSquareR',
                    color: currentPage == "통계&설정" ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
