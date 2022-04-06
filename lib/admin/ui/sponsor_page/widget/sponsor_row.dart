import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../../../model/review_model.dart';

class ReviewRow extends StatelessWidget {
  const ReviewRow({Key? key, required this.review}) : super(key: key);

  final Review review;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
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
                review.id.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
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
                review.userName,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
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
                review.review,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
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
                DateFormat("yyyy-MM-dd").format(review.reviewDate),
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'NanumSquareR',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Center(
                                  child: Text(
                                '리뷰 내역',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: PageView.builder(
                                            itemCount: review.images.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  html.window.open(
                                                      '$kBaseUrl/review_img/${review.images[index]}',
                                                      '리뷰 이미지');
                                                },
                                                child: Image.network(
                                                    '$kBaseUrl/review_img/${review.images[index]}'),
                                              );
                                            })),
                                    SizedBox(
                                      height: 30,
                                      width: 200,
                                      child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: review.images.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Container(
                                              height: 30,
                                              width: 30,
                                              color: Colors.black,
                                            );
                                          }),
                                    ),
                                    const SizedBox(height: 15),
                                    Text(review.review),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF363057),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      '삭제 하기',
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
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      '닫기',
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
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF656565)),
                        child: const Center(
                            child: Text(
                          '자세히 보기',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
