import 'dart:typed_data';

import 'package:flunyt_admin/admin/data/sponsor_page_controller.dart';
import 'package:flunyt_admin/admin/model/sponsor_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../constants.dart';
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
    height: 100,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  );
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  );

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  final sponsorController = Get.find<SponsorPageController>();

  List<String> areaList = ["하남", "강동", "송파"];

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
                    '매장',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  )
                ],
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
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15),
                child: Text(
                  '브랜드 이미지',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              InkWell(onTap: selectBanner, child: selectedBanner),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15),
                child: Text(
                  '광고 이미지',
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
              TextField(
                controller: contentController,
                onSubmitted: (text) {},
                maxLines: 5,
                minLines: 2,
                keyboardType: TextInputType.multiline,
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
                      child: ListTile(
                        title: const Text(
                          '진행중',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<SponsorStatus>(
                          activeColor: kPrimaryColor,
                          value: SponsorStatus.proceeding,
                          groupValue: sponsorStatus,
                          onChanged: (SponsorStatus? value) {
                            setState(() {
                              sponsorStatus = value;
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
                        leading: Radio<SponsorStatus>(
                          activeColor: kPrimaryColor,
                          value: SponsorStatus.end,
                          groupValue: sponsorStatus,
                          onChanged: (SponsorStatus? value) {
                            setState(() {
                              sponsorStatus = value;
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
                  if (contentImage != null &&
                      bannerImage != null &&
                      contentController.text != "" &&
                      titleController.text != "") {
                    var sponsor = Sponsor(
                      id: 0,
                      area: "area",
                      serviceType: "serviceType",
                      title: "title",
                      thumbnail: "thumbnail",
                      contentImage: "contentImage",
                      content: "content",
                      status: "status",
                    );

                    sponsorController.insertSponsor(
                        sponsor, bannerImage, contentImage);
                  }
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
            image: MemoryImage(bannerImage!),
          )),
        );
      });
    }
  }
}
