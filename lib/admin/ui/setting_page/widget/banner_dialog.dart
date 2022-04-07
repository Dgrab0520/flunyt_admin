import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../../../data/banner_data.dart';
import 'banner_add_main.dart';
import 'banner_add_sub.dart';
import 'banner_main_edit.dart';
import 'banner_sub_edit.dart';

class BannerDialog extends StatelessWidget {
  BannerDialog({Key? key}) : super(key: key);

  final bannerController = Get.put(BannerData());

  @override
  Widget build(BuildContext context) {
    bannerController.getBannerMain(); //메인 배너 불러오기
    bannerController.getBannerSub(); //서브 배너 불러오기
    return AlertDialog(
      content: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '메인 배너',
                      style: TextStyle(
                        fontFamily: 'NanumSquareEB',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var result = await Get.dialog(const BannerAddMain());
                      if (result != null) {
                        //배너 추가 성공시 메인 배너 리프레쉬
                        bannerController.getBannerMain();
                      }
                    },
                    child: const Text(
                      "배너 추가",
                      style: TextStyle(
                        fontFamily: 'NanumSquareR',
                        fontSize: 10,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: const Color(0xff506AB4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerController.bannerMain.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          //배너 클릭시 배너 업데이트 창
                          onTap: () async {
                            var result = await Get.dialog(BannerMainEdit(
                              banner: bannerController.bannerMain[index],
                            ));
                            if (result != null) {
                              //배너 업데이트 성공시 메인 배너 리프레쉬
                              bannerController.getBannerMain();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                        "$kBaseUrl/main_banner/${bannerController.bannerMain[index].bannerImg}"),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerMain[index].bannerMainTitle,
                                    style: const TextStyle(
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerMain[index].bannerSubTitle,
                                    style: const TextStyle(
                                      fontFamily: 'NanumSquareR',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '서브 배너',
                      style: TextStyle(
                        fontFamily: 'NanumSquareEB',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var result = await Get.dialog(const BannerAddSub());
                      if (result != null) {
                        //배너 추가 성공시 서브 배너 리프레쉬
                        bannerController.getBannerSub();
                      }
                    },
                    child: const Text(
                      "배너 추가",
                      style: TextStyle(
                        fontFamily: 'NanumSquareR',
                        fontSize: 10,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: const Color(0xff506AB4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerController.bannerSub.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          //배너 클릭시 서브 배너 업데이트 창
                          onTap: () async {
                            var result = await Get.dialog(BannerSubEdit(
                                banner: bannerController.bannerSub[index]));
                            if (result != null) {
                              //배너 업데이트 성공시 서브 배너 리프레쉬
                              bannerController.getBannerSub();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                        "$kBaseUrl/sub_banner/${bannerController.bannerSub[index].bannerImg}"),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerSub[index].bannerStatus,
                                    style: const TextStyle(
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("yyyy-MM-dd").format(
                                        bannerController.bannerSub[index]
                                            .bannerRegisterDate),
                                    style: const TextStyle(
                                      fontFamily: 'NanumSquareR',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
