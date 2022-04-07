import 'package:flunyt_admin/admin/data/review_page_controller.dart';
import 'package:flunyt_admin/admin/ui/widget/category_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigReview extends StatelessWidget {
  BigReview({Key? key}) : super(key: key);

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
              Padding(
                padding: EdgeInsets.only(
                  right: Get.width * 0.1,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                      color: const Color(0xFF362C5E),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
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
              ),
            ],
          ),

          const SizedBox(height: 40),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.1,
              vertical: 10,
            ),
            width: Get.width,
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 4 / 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text(
                              '스폰서 내역',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: SingleChildScrollView(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 30),
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
                                const SizedBox(height: 10),
                                Image.asset(
                                  'friday.png',
                                  width: 200,
                                ),
                                const SizedBox(height: 20),
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
                                const SizedBox(height: 10),
                                Image.asset('tgi.jpg'),
                                const SizedBox(height: 20),
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
                                const SizedBox(height: 10),
                                const Text('컨텐츠 내용'),
                                const Text('컨텐츠 내용'),
                              ],
                            )),
                            actions: <Widget>[
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF363057),
                                    borderRadius: BorderRadius.circular(5),
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
                                  margin: const EdgeInsets.only(bottom: 15),
                                  width: 120,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(5),
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
                    child: Column(
                      children: [
                        Image.asset('friday.png'),
                        const Text(
                          '[하남 미사점] TGI FRIDAYS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),

          const SizedBox(height: 10.0)
        ],
      ),
    );
  }
}
