import 'package:flunyt_admin/admin/data/main_page_controller.dart';
import 'package:flunyt_admin/admin/ui/main_page/widget/sns_dialog.dart';
import 'package:flunyt_admin/admin/ui/main_page/widget/user_row.dart';
import 'package:flunyt_admin/admin/ui/widget/category_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';

class BigMain extends StatefulWidget {
  const BigMain({Key? key}) : super(key: key);

  @override
  _BigMainState createState() => _BigMainState();
}

class _BigMainState extends State<BigMain> {
  final mainPageController = Get.find<MainPageController>();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) mainPageController.getUser(mainPageController.users.length);
  }

  bool get _isBottom {
    if (mainPageController.hasReachedMax) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.99);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CategoryHeader(
          currentPage: "인플루언서 관리",
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 20),
                //Page Title
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.1,
                    vertical: 35.0,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        '인플루언서 관리',
                        style: TextStyle(
                          fontFamily: 'NanumSquareEB',
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SnsDialog();
                            },
                          );
                        },
                        child: Container(
                          width: 70,
                          height: 25,
                          decoration: BoxDecoration(
                              color: Color(0xFF3B4E84),
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Text(
                              'SNS인증',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Summary Header
                Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
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
                                    '전체 인플루언서 수',
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
                                child: Center(
                                  child: Text(
                                    '${DateTime.now().month}월 회원가입 수',
                                    style: const TextStyle(
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
                                child: Center(
                                  child: Text(
                                    '${DateTime.now().month}월 캠페인 참여 수',
                                    style: const TextStyle(
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
                Obx(
                  () => Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
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
                                  mainPageController.mainSummary.allUserCount,
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
                                mainPageController.mainSummary.monthJoinCount,
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
                                mainPageController
                                    .mainSummary.monthCampaignCount,
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
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: Get.width * 0.8,
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
                          width: Get.width * 0.1,
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
                        margin: EdgeInsets.only(right: Get.width * 0.1),
                        child: TextField(
                          controller: mainPageController.searchController,
                          onSubmitted: (text) {
                            // //검색
                            // searchResult = [];
                            // print(text);
                            // searchResult.addAll(detail.where(
                            //     (element) =>
                            //         element.cus_id.contains(text)));
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
                                //     (element) => element.cus_id
                                //         .contains(
                                //             searchController.text)));
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
                  padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
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
                              'SNS',
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
                              '포인트',
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
                              '캠페인 참여 횟수',
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
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                    child: Obx(() => mainPageController.isLoading
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: (mainPageController.isSearch
                                    ? mainPageController.searchedUsers.length
                                    : mainPageController.users.length) +
                                (mainPageController.hasReachedMax ? 0 : 1),
                            itemBuilder: (_, int index) {
                              return index >= mainPageController.users.length
                                  ? const Center(
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 1.5),
                                      ),
                                    )
                                  : UserRow(
                                      user: mainPageController.isSearch
                                          ? mainPageController
                                              .searchedUsers[index]
                                          : mainPageController.users[index]);
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))),

                const SizedBox(
                  height: 50.0,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () {
              _scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            style: ElevatedButton.styleFrom(primary: kPrimaryColor),
            child: const Icon(CupertinoIcons.up_arrow),
          ),
        ),
      ],
    );
  }
}
