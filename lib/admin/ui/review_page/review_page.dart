import 'package:flunyt_admin/admin/ui/review_page/widget/big_review.dart';
import 'package:flunyt_admin/admin/ui/review_page/widget/small_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/review_page_controller.dart';
import '../main_page/main_page.dart';

class ReviewPage extends StatelessWidget {
  ReviewPage({Key? key}) : super(key: key);

  final reviewPageController = Get.put(ReviewPageController());
  @override
  Widget build(BuildContext context) {
    reviewPageController.getReview();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff506AB4),
        elevation: 0,
        toolbarHeight: 80,
        leading: Container(),
        leadingWidth: 0,
        title: Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 30 - 15,
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
                  Get.offAll(MainPage());
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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: MediaQuery.of(context).size.width < 1500
            ? BigReview()
            : SmallReview(),
      ),
    );
  }
}
