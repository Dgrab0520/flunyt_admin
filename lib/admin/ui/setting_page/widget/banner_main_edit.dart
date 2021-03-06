import 'dart:typed_data';
import 'dart:ui';

import 'package:flunyt_admin/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../data/banner_data.dart';
import '../../../model/main_banner_model.dart';
import 'banner_status.dart';

class BannerMainEdit extends StatefulWidget {
  const BannerMainEdit({Key? key, required this.banner}) : super(key: key);
  final MainBanner banner;

  @override
  _BannerMainEditState createState() => _BannerMainEditState();
}

class _BannerMainEditState extends State<BannerMainEdit> {
  BannerStatus? bannerStatus = BannerStatus.start;
  Uint8List? bannerImage;
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  );

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Future<Codec> callback(Uint8List bytes,
      {bool? allowUpscaling, int? cacheWidth, int? cacheHeight}) {
    bannerImage = bytes.buffer.asUint8List();
    return instantiateImageCodec(bytes,
        targetWidth: cacheWidth, targetHeight: cacheHeight);
  }

  final bannerController = Get.find<BannerData>();

  @override
  void initState() {
    setState(() {
      if (widget.banner.bannerStatus == "end") {
        bannerStatus = BannerStatus.end;
      }
      selectedImage = Container(
        height: 180,
        width: 320,
        decoration: BoxDecoration(
            image: DecorationImage(
          image:
              NetworkImage("$kBaseUrl/main_banner/${widget.banner.bannerImg}"),
        )),
      );
    });
    titleController.text = widget.banner.bannerMainTitle;
    contentController.text = widget.banner.bannerSubTitle;
    super.initState();
  }

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
                  '?????? ?????????',
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
                  '??????',
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
                    hintText: '????????? ??????????????????',
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
                  '??????',
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
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '????????? ??????????????????',
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
                          '?????????',
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
                          '??????',
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
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        BannerData.deleteMainBanner(widget.banner.id)
                            .then((value) {
                          if (value) {
                            Get.back(result: true);
                          } else {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar("??????", "?????? ????????? ??????????????????");
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xffF04C57),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '??????',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NanumSquareB',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (bannerImage == null) {
                          print("null");
                        }
                        bannerController
                            .updateMainBanner(
                          id: widget.banner.id.toString(),
                          title: titleController.text,
                          sub: contentController.text,
                          status: bannerStatus == BannerStatus.start
                              ? "start"
                              : "end",
                          uFile: bannerImage,
                        )
                            .then((value) {
                          if (value) {
                            Get.back(result: true);
                          } else {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar("??????", "?????? ??????????????? ??????????????????");
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff506AB4),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '????????????',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NanumSquareB',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    //????????? ??????
    bannerImage = await ImagePickerWeb.getImageAsBytes(); //????????? ?????? byte??? ????????????
    if (bannerImage == null && !Get.isSnackbarOpen) {
      Get.snackbar("??????", "?????? ??????????????? ?????????????????? ?????? ??????????????????");
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
        ); //????????? ???????????? ?????????
      });
    }
  }
}
