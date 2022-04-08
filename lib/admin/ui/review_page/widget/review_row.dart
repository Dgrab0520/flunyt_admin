import 'package:flunyt_admin/admin/ui/review_page/widget/review_detail.dart';
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
            padding: EdgeInsets.only(left: 10, right: 10),
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
                review.review.length >= 15
                    ? review.review.substring(0, 15) + "..."
                    : review.review,
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
                          builder: (BuildContext context) {
                            return ReviewDetail(
                              review: review,
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
