import 'dart:typed_data';

import 'package:flunyt_admin/admin/data/sponsor_page_controller.dart';
import 'package:flunyt_admin/admin/model/sponsor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../constants.dart';
import '../../../data/sponsor_add_controller.dart';
import '../sponsor_status.dart';

class SponsorAdd extends StatefulWidget {
  const SponsorAdd({
    Key? key,
  }) : super(key: key);

  @override
  _SponsorAddState createState() => _SponsorAddState();
}

class _SponsorAddState extends State<SponsorAdd> {
  SponsorStatus? sponsorStatus = SponsorStatus.proceeding;
  Uint8List? bannerImage;
  Uint8List? contentImage;
  Widget selectedBanner = Container(
      height: 120,
      width: 320,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kAccentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: 25,
        height: 25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        alignment: Alignment.center,
        child: const Icon(
          FontAwesomeIcons.plus,
          size: 20,
          color: kAccentColor,
        ),
      ));
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: kAccentColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: const Icon(
        FontAwesomeIcons.plus,
        size: 20,
        color: kAccentColor,
      ),
    ),
  );

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final sponsorController = Get.find<SponsorPageController>();
  final sponsorAddController = Get.put(SponsorAddController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '지역',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
              ),
              Container(
                width: 350,
                height: 24,
                margin: const EdgeInsets.only(left: 10, top: 10, bottom: 20),
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: sponsorAddController.areaList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            sponsorAddController.selectArea(sponsorAddController
                                .areaList.keys
                                .elementAt(index));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.symmetric(horizontal: 22),
                            decoration: BoxDecoration(
                                color: sponsorAddController.areaList.values
                                        .elementAt(index)
                                    ? kAccentColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                border:
                                    Border.all(color: kAccentColor, width: 1)),
                            alignment: Alignment.center,
                            child: Text(
                              sponsorAddController.areaList.keys
                                  .elementAt(index),
                              style: TextStyle(
                                color: sponsorAddController.areaList.values
                                        .elementAt(index)
                                    ? Colors.white
                                    : kAccentColor,
                                fontSize: 12,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '카테고리',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
              ),
              Container(
                width: 350,
                margin: const EdgeInsets.only(
                    left: 10, right: 30, top: 10, bottom: 20),
                child: Obx(
                  () => GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 3.1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: sponsorAddController.serviceList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            sponsorAddController.selectService(
                                sponsorAddController.serviceList.keys
                                    .elementAt(index));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: sponsorAddController.serviceList.values
                                        .elementAt(index)
                                    ? kAccentColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(3),
                                border:
                                    Border.all(color: kAccentColor, width: 1)),
                            alignment: Alignment.center,
                            child: Text(
                              sponsorAddController.serviceList.keys
                                  .elementAt(index),
                              style: TextStyle(
                                color: sponsorAddController.serviceList.values
                                        .elementAt(index)
                                    ? Colors.white
                                    : kAccentColor,
                                fontSize: 12,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '썸네일 이미지',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(onTap: selectBanner, child: selectedBanner),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '광고 이미지',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              InkWell(onTap: selectImage, child: selectedImage),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '제목',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
              ),
              Container(
                width: Get.width,
                height: 60,
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: titleController,
                  cursorColor: kPrimaryColor,
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
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '내용',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
              ),
              TextField(
                controller: contentController,
                onSubmitted: (text) {},
                maxLines: 5,
                minLines: 2,
                keyboardType: TextInputType.multiline,
                cursorColor: kPrimaryColor,
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
                    borderSide: BorderSide(color: Color(0xFF616CA1), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFF616CA1), width: 2),
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
                        child: Row(
                      children: [
                        Radio<SponsorStatus>(
                          activeColor: kAccentColor,
                          value: SponsorStatus.proceeding,
                          groupValue: sponsorStatus,
                          onChanged: (SponsorStatus? value) {
                            setState(() {
                              sponsorStatus = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '진행중',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Radio<SponsorStatus>(
                          activeColor: kAccentColor,
                          value: SponsorStatus.end,
                          groupValue: sponsorStatus,
                          onChanged: (SponsorStatus? value) {
                            setState(() {
                              sponsorStatus = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '종료',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (contentImage != null &&
                      bannerImage != null &&
                      contentController.text != "" &&
                      titleController.text != "") {
                    var sponsor = Sponsor(
                      id: 0,
                      area: "area",
                      serviceType: "serviceType",
                      title: titleController.text,
                      thumbnail: "thumbnail",
                      contentImage: "contentImage",
                      content: contentController.text,
                      status: sponsorStatus == SponsorStatus.proceeding
                          ? "proceeding"
                          : "end",
                    );

                    sponsorAddController
                        .insertSponsor(sponsor, bannerImage, contentImage)
                        .then((value) {
                      if (value) {
                        Get.back(result: true);
                        if (!Get.isSnackbarOpen) {
                          Get.snackbar("성공", "스폰서를 성공적으로 추가했습니다");
                        }
                      } else {
                        if (!Get.isSnackbarOpen) {
                          Get.snackbar("실패", "추가하지 못했습니다");
                        }
                      }
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: kAccentColor,
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

  selectBanner() async {
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
        selectedBanner = Container(
          height: 100,
          width: 320,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: MemoryImage(bannerImage!),
          )),
        );
      });
    }
  }

  selectImage() async {
    contentImage = await ImagePickerWeb.getImageAsBytes();
    if (contentImage == null && !Get.isSnackbarOpen) {
      Get.snackbar("실패", "파일 불러오기를 실패했습니다 다시 시도해주세요");
    }
    print(contentImage!.length);
    if (contentImage!.length >= 8388608 && !Get.isSnackbarOpen) {
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
            image: MemoryImage(contentImage!),
          )),
        );
      });
    }
  }
}
