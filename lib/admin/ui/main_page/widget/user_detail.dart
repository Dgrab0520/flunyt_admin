import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/user_model.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        '인플루언서 관리',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Icon(Icons.arrow_right),
                      Text(
                        '번호',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(widget.user.id.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        'SNS 정보',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(widget.user.userSNSType.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '아이디',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(widget.user.userId.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_right),
                          Text(
                            '성별',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                          width: 400,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_right, color: Colors.white),
                              Text(widget.user.userSex.toString()),
                            ],
                          )),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '마일리지',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text('0 M'),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '포인트',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text('0 P'),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '캠페인 참여 횟수',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text('0 건'),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '가입일',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(DateFormat("yyyy-MM-dd")
                          .format(widget.user.userRegisterDate)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 120,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFF363057),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              '삭제 하기',
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
}
