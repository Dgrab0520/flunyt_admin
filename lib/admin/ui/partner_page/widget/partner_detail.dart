import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../model/client_model.dart';

class PartnerDetail extends StatefulWidget {
  const PartnerDetail({Key? key, required this.client}) : super(key: key);
  final Client client;

  @override
  _PartnerDetailState createState() => _PartnerDetailState();
}

enum Gender { MAN, WOMEN }

class _PartnerDetailState extends State<PartnerDetail> {
  int _counter = 0;
  var _isChecked = false;
  Gender _gender = Gender.MAN;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        '업체 관리',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      )),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Container(
              width: 400,
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
                      Text(widget.client.id.toString()),
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
                      Text(widget.client.clientId.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '담당자명',
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
                      Text(widget.client.clientName.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '연락처',
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
                      Text(widget.client.clientPhone.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '회사명',
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
                      Text(widget.client.clientCompany.toString()),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(Icons.arrow_right),
                      Text(
                        '사업자번호',
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
                      Text(widget.client.clientNo),
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
                  SizedBox(height: 0),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      SizedBox(height: 5),
                      Text(DateFormat('yyyy-MM-dd')
                          .format(widget.client.registerDate)),
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
