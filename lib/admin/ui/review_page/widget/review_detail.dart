// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flunyt_admin/admin/data/review_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../model/review_model.dart';

class ReviewDetail extends StatefulWidget {
  const ReviewDetail({Key? key, required this.review}) : super(key: key);

  final Review review;
  @override
  _ReviewDetailState createState() => _ReviewDetailState();
}

class _ReviewDetailState extends State<ReviewDetail> {
  late Review review;
  int imageIndex = 0;
  @override
  void initState() {
    review = widget.review;
    super.initState();
  }

  final reviewController = Get.find<ReviewPageController>();

  @override
  Widget build(BuildContext context) {
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
                width: 350,
                height: 200,
                child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        imageIndex = index;
                      });
                    },
                    itemCount: review.images.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          html.window.open(
                              '$kBaseUrl/review_img/${review.images[index]}',
                              '리뷰 이미지');
                        },
                        child: Image.network(
                          '$kBaseUrl/review_img/${review.images[index]}',
                          fit: BoxFit.cover,
                        ),
                      );
                    })),
            Container(
              height: 7,
              width: 350,
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: review.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 7,
                      width: 7,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                        color:
                            index == imageIndex ? kPrimaryColor : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 15),
            SizedBox(
                width: 350,
                child: Text(
                  review.review,
                  softWrap: true,
                )),
          ],
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            reviewController.deleteReview(review.id).then((value) {
              if (value) {
                Get.back(result: true);
                if (!Get.isSnackbarOpen) {
                  Get.snackbar("성공", "리뷰를 성공적으로 삭제했습니다");
                }
              } else {
                if (!Get.isSnackbarOpen) {
                  Get.snackbar("실패", "삭제를 실패했습니다");
                }
              }
            });
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
  }
}
