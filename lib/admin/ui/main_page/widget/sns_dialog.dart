// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flunyt_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/main_page_controller.dart';
import '../../../model/user_auth_model.dart';

enum Rank { silver, gold, platinum, vip }

class SnsDialog extends StatelessWidget {
  SnsDialog({Key? key}) : super(key: key);

  final mainPageController = Get.find<MainPageController>();
  @override
  Widget build(BuildContext context) {
    mainPageController.getUserAuth();
    return AlertDialog(
      title: const Center(
          child: Text(
        'SNS인증',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      content: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              width: Get.width,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFeeeeee),
                          border: Border.all(
                              width: 1, color: const Color(0xFFcccccc))),
                      child: const Center(
                        child: Text(
                          '번호',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
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
                        color: Color(0xFFeeeeee),
                        border: Border(
                          top: BorderSide(
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
                      child: const Center(
                        child: Text(
                          '아이디',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
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
                        color: Color(0xFFeeeeee),
                        border: Border(
                          top: BorderSide(
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
                      child: const Center(
                        child: Text(
                          '링크',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
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
                        color: Color(0xFFeeeeee),
                        border: Border(
                          top: BorderSide(
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
                      child: const Center(
                        child: Text(
                          '심사과정',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
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
                        color: Color(0xFFeeeeee),
                        border: Border(
                          top: BorderSide(
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
                      child: const Center(
                        child: Text(
                          '가입일',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
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
                        color: Color(0xFFeeeeee),
                        border: Border(
                          top: BorderSide(
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
                      child: const Center(
                        child: Text(
                          '관리',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(() => Expanded(
                child: ListView.builder(
                    itemCount: mainPageController.userAuth.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: Get.width,
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 30,
                          right: MediaQuery.of(context).size.width / 30,
                        ),
                        child: Row(
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
                                    )),
                                child: Center(
                                  child: Text(
                                    mainPageController.userAuth[index].id
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 14,
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
                                  color: Color(0xFFffffff),
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
                                    mainPageController.userAuth[index].userId,
                                    style: const TextStyle(
                                      fontSize: 14,
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
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFffffff),
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
                                  child: InkWell(
                                    onTap: () {
                                      html.window.open(
                                          mainPageController
                                              .userAuth[index].snsLink,
                                          'sns링크');
                                    },
                                    child: Text(
                                      mainPageController
                                          .userAuth[index].snsLink,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'NanumSquareR',
                                      ),
                                      textAlign: TextAlign.center,
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
                                  color: Color(0xFFffffff),
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
                                    mainPageController
                                        .userAuth[index].authResult,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'NanumSquareR',
                                      color: mainPageController
                                                  .userAuth[index].authResult ==
                                              "심사완료"
                                          ? Colors.blue
                                          : mainPageController.userAuth[index]
                                                      .authResult ==
                                                  "승인"
                                              ? Colors.green
                                              : mainPageController
                                                          .userAuth[index]
                                                          .authResult ==
                                                      "심사불가"
                                                  ? Colors.red
                                                  : Colors.black,
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
                                  color: Color(0xFFffffff),
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
                                    DateFormat('yyyy-MM-dd').format(
                                        mainPageController
                                            .userAuth[index].regDate),
                                    style: const TextStyle(
                                      fontSize: 14,
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
                                  color: Color(0xFFffffff),
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
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          if (mainPageController
                                                  .userAuth[index].authResult !=
                                              "심사완료") {
                                            var result = await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return RankDialog(
                                                  auth: mainPageController
                                                      .userAuth[index],
                                                );
                                              },
                                            );
                                            if (result != null) {
                                              mainPageController.getUserAuth();
                                            }
                                          }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 7, top: 7, bottom: 7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xFF3B4E84)),
                                          child: const Center(
                                              child: Text(
                                            '승인 하기',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () async {
                                          var result = await showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return RejectedDialog(
                                                auth: mainPageController
                                                    .userAuth[index],
                                              );
                                            },
                                          );
                                          if (result != null) {
                                            mainPageController.getUserAuth();
                                          }
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              top: 7, right: 7, bottom: 7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color(0xFF656565)),
                                          child: const Center(
                                              child: Text(
                                            '거절 하기',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }))),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF363057),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: const Text(
              '닫기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}

class RejectedDialog extends StatefulWidget {
  const RejectedDialog({Key? key, required this.auth}) : super(key: key);

  final UserAuth auth;

  @override
  _RejectedDialogState createState() => _RejectedDialogState();
}

class _RejectedDialogState extends State<RejectedDialog> {
  final reasonController = TextEditingController();
  final mainPageController = Get.find<MainPageController>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        'SNS 거절',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      content: Container(
          padding: const EdgeInsets.only(
            bottom: 50,
          ),
          child: TextField(
            controller: reasonController,
            minLines: 2,
            maxLines: 7,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "거절 사유를 입력 해주세요.",
                labelStyle: TextStyle(
                  fontSize: 12,
                )),
          )),
      actions: <Widget>[
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF3B4E84),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: const Text(
              '거절 하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              if (reasonController.text != "") {
                mainPageController
                    .updateAuth(widget.auth.id, widget.auth.userId, "심사불가",
                        reasonController.text, "type", "snsId")
                    .then((value) {
                  if (value) {
                    Navigator.of(context).pop(true);
                  } else {
                    Get.snackbar("실패", "업데이트 실패");
                  }
                });
              }
            },
          ),
        ),
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: const Text(
              '취소 하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}

class RankDialog extends StatefulWidget {
  const RankDialog({Key? key, required this.auth}) : super(key: key);

  final UserAuth auth;
  @override
  _RankDialogState createState() => _RankDialogState();
}

class _RankDialogState extends State<RankDialog> {
  Rank _rank = Rank.silver;

  List<bool> selectedType = [
    true,
    false,
    false,
    false,
    false,
  ];

  final mainPageController = Get.find<MainPageController>();
  final snsIdController = TextEditingController();

  @override
  void initState() {
    snsIdController.text = widget.auth.snsLink.split("/")[3];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        'SNS 승인',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      content: SizedBox(
        width: 300,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              children: [
                const Icon(Icons.arrow_right),
                Text(
                  '아이디 : ${widget.auth.userId}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'NanumSquareB',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Row(
                  children: const [
                    Icon(Icons.arrow_right),
                    Text(
                      '링크 : ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: Text(
                    widget.auth.snsLink,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(Icons.arrow_right),
                Text(
                  'SNS ID',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NanumSquareB',
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                controller: snsIdController,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                Icon(Icons.arrow_right),
                Text(
                  '등급',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NanumSquareB',
                  ),
                )
              ],
            ),
            ListTile(
              title: const Text(
                'SILVER',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              subtitle: const Text(
                '100~1000명 미만',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareR',
                ),
              ),
              leading: Radio(
                value: Rank.silver,
                groupValue: _rank,
                activeColor: kPrimaryColor,
                onChanged: (Rank? value) {
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'GOLD',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              subtitle: const Text(
                '1000~5000명 미만',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareR',
                ),
              ),
              leading: Radio(
                value: Rank.gold,
                groupValue: _rank,
                activeColor: kPrimaryColor,
                onChanged: (Rank? value) {
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'PLATINUM',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              subtitle: const Text(
                '5000~1만명 미만',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareR',
                ),
              ),
              leading: Radio(
                value: Rank.platinum,
                groupValue: _rank,
                activeColor: kPrimaryColor,
                onChanged: (Rank? value) {
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text(
                'VIP',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareB',
                ),
              ),
              subtitle: const Text(
                '1만명 이상',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'NanumSquareR',
                ),
              ),
              leading: Radio(
                value: Rank.vip,
                groupValue: _rank,
                activeColor: kPrimaryColor,
                onChanged: (Rank? value) {
                  print(value);
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Icon(Icons.arrow_right),
                Text(
                  '타입',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NanumSquareB',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedType
                          .setRange(0, 5, [true, false, false, false, false]);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: selectedType[0] ? kAccentColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kAccentColor, width: 1)),
                    alignment: Alignment.center,
                    child: Text(
                      "인스타그램",
                      style: TextStyle(
                        color: selectedType[0] ? Colors.white : kAccentColor,
                        fontSize: 12,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedType
                          .setRange(0, 5, [false, true, false, false, false]);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: selectedType[1] ? kAccentColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kAccentColor, width: 1)),
                    alignment: Alignment.center,
                    child: Text(
                      "블로그",
                      style: TextStyle(
                        color: selectedType[1] ? Colors.white : kAccentColor,
                        fontSize: 12,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedType
                          .setRange(0, 5, [false, false, true, false, false]);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: selectedType[2] ? kAccentColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kAccentColor, width: 1)),
                    alignment: Alignment.center,
                    child: Text(
                      "유튜브",
                      style: TextStyle(
                        color: selectedType[2] ? Colors.white : kAccentColor,
                        fontSize: 12,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedType
                          .setRange(0, 5, [false, false, false, true, false]);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: selectedType[3] ? kAccentColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kAccentColor, width: 1)),
                    alignment: Alignment.center,
                    child: Text(
                      "틱톡",
                      style: TextStyle(
                        color: selectedType[3] ? Colors.white : kAccentColor,
                        fontSize: 12,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedType
                          .setRange(0, 5, [false, false, false, false, true]);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                        color: selectedType[4] ? kAccentColor : Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: kAccentColor, width: 1)),
                    alignment: Alignment.center,
                    child: Text(
                      "페이스북",
                      style: TextStyle(
                        color: selectedType[4] ? Colors.white : kAccentColor,
                        fontSize: 12,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: const Color(0xFF3B4E84),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: const Text(
              '승인 하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              String index = "";
              String type = "";
              switch (_rank) {
                case Rank.silver:
                  index = "silver";
                  break;
                case Rank.gold:
                  index = "gold";
                  break;
                case Rank.platinum:
                  index = "platinum";
                  break;
                case Rank.vip:
                  index = "vip";
                  break;
                default:
                  index = "";
              }
              if (selectedType[0]) {
                type = "IS";
              } else if (selectedType[1]) {
                type = "BG";
              } else if (selectedType[2]) {
                type = "YT";
              } else if (selectedType[3]) {
                type = "TT";
              } else {
                type = "FB";
              }
              mainPageController
                  .updateAuth(widget.auth.id, widget.auth.userId, "심사완료", index,
                      type, snsIdController.text)
                  .then((value) {
                if (value) {
                  Navigator.of(context).pop(true);
                } else {
                  Get.snackbar("실패", "업데이트 실패");
                }
              });
            },
          ),
        ),
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: const Text(
              '취소 하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ],
    );
  }
}
