import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../data/main_page_controller.dart';

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
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return RankDialog();
                                            },
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 7, top: 7, bottom: 7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xFF3B4E84)),
                                          child: Center(
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
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                child: AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                    'SNS 거절',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                                  content: Container(
                                                      padding: EdgeInsets.only(
                                                        bottom: 50,
                                                      ),
                                                      child: TextField(
                                                        minLines: 2,
                                                        maxLines: 7,
                                                        decoration:
                                                            InputDecoration(
                                                                border:
                                                                    OutlineInputBorder(),
                                                                labelText:
                                                                    "거절 사유를 입력 해주세요.",
                                                                labelStyle:
                                                                    TextStyle(
                                                                  fontSize: 12,
                                                                )),
                                                      )),
                                                  actions: <Widget>[
                                                    Container(
                                                      width: 120,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF3B4E84),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: FlatButton(
                                                        child: Text(
                                                          '거절 하기',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 120,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: FlatButton(
                                                        child: Text(
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
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              top: 7, right: 7, bottom: 7),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color(0xFF656565)),
                                          child: Center(
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
            color: Color(0xFF363057),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: Text(
              '삭제 하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
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
            child: Text(
              '취소 하기',
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

class RankDialog extends StatefulWidget {
  const RankDialog({Key? key}) : super(key: key);

  @override
  _RankDialogState createState() => _RankDialogState();
}

class _RankDialogState extends State<RankDialog> {
  Rank _rank = Rank.silver;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
          child: Text(
        'SNS 승인',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      content: Container(
        height: 500,
        width: 300,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('SILVER'),
              leading: Radio(
                value: Rank.silver,
                groupValue: _rank,
                onChanged: (Rank? value) {
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('GOLD'),
              leading: Radio(
                value: Rank.gold,
                groupValue: _rank,
                onChanged: (Rank? value) {
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('PLATINUM'),
              leading: Radio(
                value: Rank.platinum,
                groupValue: _rank,
                onChanged: (Rank? value) {
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('VIP'),
              leading: Radio(
                value: Rank.vip,
                groupValue: _rank,
                onChanged: (Rank? value) {
                  print(value);
                  setState(() {
                    _rank = value!;
                  });
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        Container(
          width: 120,
          height: 30,
          decoration: BoxDecoration(
            color: Color(0xFF3B4E84),
            borderRadius: BorderRadius.circular(5),
          ),
          child: FlatButton(
            child: Text(
              '승인 하기',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
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
            child: Text(
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
