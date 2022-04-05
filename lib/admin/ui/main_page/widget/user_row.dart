import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/user_model.dart';

class UserRow extends StatelessWidget {
  const UserRow({Key? key, required this.user}) : super(key: key);

  final User user;
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
                user.id.toString(),
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
                user.userId,
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
                "0 M",
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
                '0 PT',
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
                '0 건',
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
                DateFormat("yyyy-MM-dd").format(user.userRegisterDate),
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
                      onTap: () {},
                      child: Container(
                        height: 25.0,
                        width: 77.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF656565)),
                        child: const Center(
                            child: Text(
                          '삭제',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 25.0,
                        width: 77.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF656565)),
                        child: const Center(
                            child: Text(
                          '수정',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
