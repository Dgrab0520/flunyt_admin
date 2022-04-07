// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../../constants.dart';
import '../../../model/sponsor_model.dart';
import '../sponsor_status.dart';

class SponsorDialog extends StatefulWidget {
  const SponsorDialog({Key? key, required this.sponsor}) : super(key: key);
  final Sponsor sponsor;

  @override
  _SponsorDialogState createState() => _SponsorDialogState();
}

class _SponsorDialogState extends State<SponsorDialog> {
  SponsorStatus? sponsorStatus = SponsorStatus.proceeding;
  Uint8List? bannerImage; //배너 이미지
  Widget selectedImage = Container(
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  );
  bool isEdit = false;
  TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    setState(() {
      if (widget.sponsor.status == "end") {
        sponsorStatus = SponsorStatus.end;
      }
      contentController.text = widget.sponsor.content;
      selectedImage = Image.network(
        '$kBaseUrl/sponsor_img/${widget.sponsor.contentImage}',
        width: 300,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          Image.network(
            '$kBaseUrl/sponsor_img/${widget.sponsor.thumbnail}',
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
          InkWell(
            onTap: () {
              if (isEdit) {
                selectImage();
              } else {
                html.window.open(
                    '$kBaseUrl/sponsor_img/${widget.sponsor.contentImage}',
                    '스폰서 이미지');
              }
            },
            child: selectedImage,
          ),
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
          contentWidget(),
          const SizedBox(height: 10),
          statusWidget()
        ],
      )),
      actions: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              isEdit = !isEdit;
            });
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

  Widget statusWidget() {
    return isEdit
        ? SizedBox(
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
          )
        : Row(
            children: [
              const Icon(Icons.arrow_right),
              Text(
                '스폰서 상태 : ' +
                    ((sponsorStatus == SponsorStatus.proceeding)
                        ? '진행중'
                        : '종료'),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareB',
                ),
              ),
            ],
          );
  }

  Widget contentWidget() {
    return isEdit
        ? TextField(
            controller: contentController,
            onSubmitted: (text) {},
            maxLines: 4,
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
          )
        : Text(contentController.text);
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
        selectedImage = Image.memory(
          bannerImage!,
          width: 300,
        );
      });
    }
  }
}
