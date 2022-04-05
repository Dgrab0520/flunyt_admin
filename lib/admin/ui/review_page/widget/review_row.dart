import 'package:flunyt_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/review_model.dart';

class ReviewRow extends StatelessWidget {
  const ReviewRow({Key? key, required this.review}) : super(key: key);

  final Review review;
  @override
  Widget build(BuildContext context) {
    return Row(
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
              ),
            ),
            child: Center(
              child: Text(
                review.id.toString(),
                style: const TextStyle(
                  fontSize: 12,
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
              color: Colors.white,
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
                review.userName,
                style: const TextStyle(
                  fontSize: 12,
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
              color: Colors.white,
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
                review.review,
                style: const TextStyle(
                  fontSize: 12,
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
              color: Colors.white,
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
                DateFormat("yyyy-MM-dd").format(review.reviewDate),
                style: const TextStyle(
                  fontSize: 12,
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
              color: Colors.white,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Center(
                                  child: Text(
                                '리뷰 내역',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Image.network(
                                          '$baseUrl/review_img/${review.images[0]}'),
                                    ),
                                    SizedBox(height: 15),
                                    Text(review.review),
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
                          },
                        );
                      },
                      child: Container(
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF656565)),
                        child: const Center(
                            child: Text(
                          '자세히 보기',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
