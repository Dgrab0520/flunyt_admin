import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../constants.dart';
import '../../../data/banner_data.dart';
import '../../../model/main_banner_model.dart';
import 'banner_status.dart';

class BannerAddMain extends StatefulWidget {
  const BannerAddMain({
    Key? key,
  }) : super(key: key);

  @override
  _BannerAddMainState createState() => _BannerAddMainState();
}

class _BannerAddMainState extends State<BannerAddMain> {
  BannerStatus? bannerStatus = BannerStatus.start;
  Uint8List? bannerImage; //배너 이미지
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  ); //화면에 표시되는 이미지

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

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
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15),
                child: Text(
                  '제목',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: 60,
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '제목을 입력해주세요',
                    hintStyle: TextStyle(
                      color: Color(0xFF929292),
                      fontSize: 12,
                    ),
                    fillColor: Color(0xFFF5F7F9),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF616CA1), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF616CA1), width: 2),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15),
                child: Text(
                  '내용',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: 60,
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: contentController,
                  onSubmitted: (text) {},
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '내용을 입력해주세요',
                    hintStyle: TextStyle(
                      color: Color(0xFF929292),
                      fontSize: 12,
                    ),
                    fillColor: Color(0xFFF5F7F9),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF616CA1), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                          BorderSide(color: Color(0xFF616CA1), width: 2),
                    ),
                  ),
                ),
              ),
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
                  var banner = MainBanner(
                      id: 0,
                      bannerId: "bannerId",
                      bannerMainTitle: titleController.text,
                      bannerSubTitle: contentController.text,
                      bannerImg: "bannerImg",
                      bannerDetailImg: "bannerDetailImg",
                      bannerStatus:
                          bannerStatus == BannerStatus.start ? "start" : "end",
                      bannerRegisterDate: DateTime.now());
                  bannerController
                      .insertMainBanner(banner, bannerImage)
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
    if (bannerImage == null) {
      Get.snackbar("실패", "파일 불러오기를 실패했습니다 다시 시도해주세요");
    }
    print(bannerImage!.length);
    if (bannerImage!.length >= 8388608) {
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
