import 'package:flunyt_admin/admin/data/partner_page_controller.dart';
import 'package:flunyt_admin/admin/ui/partner_page/widget/partner_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/category_header.dart';

class SmallPartner extends StatelessWidget {
  SmallPartner({Key? key}) : super(key: key);

  final partnerPageController = Get.find<PartnerController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryHeader(
          currentPage: "업체 관리",
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),

                //Page Title
                Container(
                  width: Get.width,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 30,
                    right: MediaQuery.of(context).size.width / 30,
                    top: MediaQuery.of(context).size.width / 70,
                    bottom: MediaQuery.of(context).size.width / 70,
                  ),
                  child: const Text(
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
                          children: const [
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
                        const SizedBox(height: 20.0),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: 120,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFeeeeee),
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xFFcccccc))),
                                child: const Center(
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
                                decoration: const BoxDecoration(
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
                                child: const Center(
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
                                decoration: const BoxDecoration(
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
                                child: const Center(
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
                                decoration: const BoxDecoration(
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
                                child: const Center(
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
                          decoration: const BoxDecoration(
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
                              '${DateTime.now().year}년 ${DateTime.now().month}월',
                              style: const TextStyle(
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
                          decoration: const BoxDecoration(
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
                            child: Obx(
                              () => Text(
                                '${partnerPageController.partners.length} 명',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'NanumSquareR',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: const BoxDecoration(
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
                              style: const TextStyle(
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
                          decoration: const BoxDecoration(
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
                              style: const TextStyle(
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

                const SizedBox(height: 30),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
                  child: const Divider(
                    height: 0.0,
                    thickness: 1.0,
                    color: Color(0xFFe6e6e6),
                  ),
                ),

                const SizedBox(height: 30),

                //Search
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 30,
                        ),
                        const Icon(Icons.arrow_right),
                        const Text(
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
                        margin: EdgeInsets.only(right: Get.width / 30),
                        child: TextField(
                          controller: partnerPageController.searchController,
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
                            hintStyle: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'NanumSquareB',
                            ),
                            fillColor: const Color(0xFF2A2D3E).withOpacity(0.1),
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF2697FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Icon(
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

                const SizedBox(height: 40),

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
                              color: const Color(0xFFeeeeee),
                              border: Border.all(
                                  width: 1, color: const Color(0xFFcccccc))),
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                          decoration: const BoxDecoration(
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
                          child: const Center(
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
                Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30,
                    ),
                    child: Obx(() => partnerPageController.isLoading
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: partnerPageController.isSearch
                                ? partnerPageController.searchedPartners.length
                                : partnerPageController.partners.length,
                            itemBuilder: (_, int index) {
                              return PartnerRow(
                                  client: partnerPageController.isSearch
                                      ? partnerPageController
                                          .searchedPartners[index]
                                      : partnerPageController.partners[index]);
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))),

                const SizedBox(height: 40.0)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
