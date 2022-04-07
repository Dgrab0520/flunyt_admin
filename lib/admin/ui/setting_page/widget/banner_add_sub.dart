import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../constants.dart';
import '../../../data/banner_data.dart';
import 'banner_status.dart';

class BannerAddSub extends StatefulWidget {
  const BannerAddSub({Key? key}) : super(key: key);

  @override
  _BannerAddSubState createState() => _BannerAddSubState();
}

class _BannerAddSubState extends State<BannerAddSub> {
  BannerStatus? bannerStatus = BannerStatus.start;
  Uint8List? bannerImage; //배너 이미지
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  ); //화면에 표시되는 이미지

  final bannerController = Get.put(BannerData());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '배너 이미지',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              InkWell(onTap: selectImage, child: selectedImage),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          '진행중',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<BannerStatus>(
                          activeColor: kPrimaryColor,
                          value: BannerStatus.start,
                          groupValue: bannerStatus,
                          onChanged: (BannerStatus? value) {
                            setState(() {
                              bannerStatus = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          '종료',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<BannerStatus>(
                          activeColor: kPrimaryColor,
                          value: BannerStatus.end,
                          groupValue: bannerStatus,
                          onChanged: (BannerStatus? value) {
                            setState(() {
                              bannerStatus = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  bannerController
                      .insertSubBanner(
                          bannerStatus == BannerStatus.start ? "start" : "end",
                          bannerImage)
                      .then((value) {
                    if (value) {
                      Get.back(result: true);
                    } else {
                      if (!Get.isSnackbarOpen) {
                        Get.snackbar("오류", "배너를 저장하지 못했습니다");
                      }
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff506AB4),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      '업로드',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NanumSquareB',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    bannerImage = await ImagePickerWeb.getImageAsBytes();
    if (bannerImage == null && !Get.isSnackbarOpen) {
      Get.snackbar("실패", "파일 불러오기를 실패했습니다 다시 시도해주세요");
    }
    print(bannerImage!.length);
    if (bannerImage!.length >= 8388608 && !Get.isSnackbarOpen) {
      Get.back();
      Get.snackbar("Error", "Too Big File(max : 8MB)",
          backgroundColor: Colors.white);
    } else {
      setState(() {
        selectedImage = Container(
          height: 180,
          width: 320,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: MemoryImage(bannerImage!),
          )),
        );
      });
    }
  }
}
