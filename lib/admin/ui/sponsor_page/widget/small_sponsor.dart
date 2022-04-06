import 'package:flunyt_admin/admin/data/review_page_controller.dart';
import 'package:flunyt_admin/admin/ui/widget/category_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallReview extends StatelessWidget {
  SmallReview({Key? key}) : super(key: key);

  final reviewPageController = Get.find<ReviewPageController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CategoryHeader(currentPage: "스폰서 관리"),

          const SizedBox(height: 20),

          //Page Title
          Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1,
              vertical: 35.0,
            ),
            child: const Text(
              '스폰서 관리',
              style: TextStyle(
                fontFamily: 'NanumSquareEB',
                fontSize: 18,
              ),
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
                                  width: 1, color: const Color(0xFFcccccc))),
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
                              '전체 스폰서 수',
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
                              '${DateTime.now().month}월 추가 스폰서 수',
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
                          child: const Center(
                            child: Text(
                              '계약 종료 수',
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
                      child: Text(
                        '0 명',
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
                        '0 건',
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
                        '0 건',
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
                    controller: reviewPageController.searchController,
                    onSubmitted: (text) {
                      // //검색
                      // searchResult = [];
                      // print(text);
                      // searchResult.addAll(detail.where((element) =>
                      //     element.com_name.contains(text)));
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
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          // //검색
                          // searchResult = [];
                          // print(searchController.text);
                          // searchResult.addAll(detail.where((element) =>
                          //     element.com_name
                          //         .contains(searchController.text)));
                          // print(searchResult);
                          // setState(() {
                          //   isSearch = true;
                          // });
                        },
                        child: Container(
                          width: 35.0,
                          height: 35.0,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: const BoxDecoration(
                            color: Color(0xFF2697FF),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
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
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1,
              vertical: 35.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF362C5E),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        '+  광고 추가',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.1,
                    vertical: 10,
                  ),
                  width: Get.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '스폰서 내역',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          children: const [
                                            Icon(Icons.arrow_right),
                                            Text(
                                              '매장',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Image.asset(
                                          'friday.png',
                                          width: 200,
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: const [
                                            Icon(Icons.arrow_right),
                                            Text(
                                              '광고 포스터',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Image.asset('tgi.jpg'),
                                        SizedBox(height: 20),
                                        Row(
                                          children: const [
                                            Icon(Icons.arrow_right),
                                            Text(
                                              '컨텐츠 내용',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text('컨텐츠 내용'),
                                        Text('컨텐츠 내용'),
                                      ],
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Container(),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF363057),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          '수정 하기',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          '취소 하기',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 200,
                            child: Column(
                              children: [
                                Image.asset('friday.png'),
                                Text(
                                  '[하남 미사점] TGI FRIDAYS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset('friday.png'),
                              Text(
                                '[하남 미사점] TGI FRIDAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset('friday.png'),
                              Text(
                                '[하남 미사점] TGI FRIDAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset('friday.png'),
                              Text(
                                '[하남 미사점] TGI FRIDAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.1,
                    vertical: 10,
                  ),
                  width: Get.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '스폰서 내역',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 30),
                                        Row(
                                          children: const [
                                            Icon(Icons.arrow_right),
                                            Text(
                                              '매장',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Image.asset(
                                          'friday.png',
                                          width: 200,
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: const [
                                            Icon(Icons.arrow_right),
                                            Text(
                                              '광고 포스터',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Image.asset('tgi.jpg'),
                                        SizedBox(height: 20),
                                        Row(
                                          children: const [
                                            Icon(Icons.arrow_right),
                                            Text(
                                              '컨텐츠 내용',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Text('컨텐츠 내용'),
                                        Text('컨텐츠 내용'),
                                      ],
                                    ),
                                  ),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Container(),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF363057),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          '수정 하기',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: const Text(
                                          '취소 하기',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 200,
                            child: Column(
                              children: [
                                Image.asset('friday.png'),
                                Text(
                                  '[하남 미사점] TGI FRIDAYS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset('friday.png'),
                              Text(
                                '[하남 미사점] TGI FRIDAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset('friday.png'),
                              Text(
                                '[하남 미사점] TGI FRIDAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset('friday.png'),
                              Text(
                                '[하남 미사점] TGI FRIDAYS',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
