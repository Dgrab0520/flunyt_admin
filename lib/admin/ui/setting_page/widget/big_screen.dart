import 'package:data_table_2/data_table_2.dart';
import 'package:flunyt_admin/admin/data/setting_page_controller.dart';
import 'package:flunyt_admin/admin/ui/setting_page/widget/all_inf_chart.dart';
import 'package:flunyt_admin/admin/ui/setting_page/widget/chart_widget.dart';
import 'package:flunyt_admin/admin/ui/setting_page/widget/top_category.dart';
import 'package:flunyt_admin/admin/ui/setting_page/widget/top_saved.dart';
import 'package:flunyt_admin/admin/ui/widget/category_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigScreen extends StatelessWidget {
  BigScreen({Key? key}) : super(key: key);

  final settingPageController = Get.find<SettingPageController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CategoryHeader(currentPage: "통계&설정"),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 30,
                          right: 10.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        height: 245,
                        child: Column(
                          children: [
                            const Text(
                              '지역별 이용 현황',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Obx(
                              () => SizedBox(
                                  height: 150,
                                  child: SingleChildScrollView(
                                    child: DataTable2(
                                      columnSpacing: 10,
                                      minWidth: 450,
                                      columns: const [
                                        DataColumn(
                                          label: Text(
                                            "지역",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.deepOrange,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                            label: Center(
                                          child: Text(
                                            "리뷰 횟수(건)",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.deepOrange,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        )),
                                      ],
                                      rows: settingPageController.areaList,
                                    ),
                                  )),
                            ),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 30,
                          right: 10.0,
                        ),
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        height: 245,
                        child: Column(
                          children: [
                            const Text(
                              '카테고리 이용 현황',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'NanumSquareEB',
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Obx(
                              () => SizedBox(
                                  height: 150,
                                  child: SingleChildScrollView(
                                    child: DataTable2(
                                      columnSpacing: 10,
                                      minWidth: 450,
                                      columns: const [
                                        DataColumn(
                                          label: Text(
                                            "카테고리",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.deepOrange,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                            label: Center(
                                          child: Text(
                                            "리뷰 횟수(건)",
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.deepOrange,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        )),
                                      ],
                                      rows: settingPageController.categoryList,
                                    ),
                                  )),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 30,
                    top: MediaQuery.of(context).size.width / 30,
                    bottom: MediaQuery.of(context).size.width / 30,
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 20),
                    width: 400,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '월별 이용현황',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          height: 410,
                          child: ChartWidget(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 400,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(height: 15),
                      AllInfChart(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 400,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(height: 15),
                      TopSaved(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  width: 400,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SizedBox(height: 15),
                      TopCategory(),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10.0,),
              // Expanded(
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     width:400,
              //     height:350,
              //     decoration:BoxDecoration(
              //       color:Colors.white,
              //       borderRadius: BorderRadius.circular(5),
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         SizedBox(height:15),
              //         SfCircularChart(
              //             title: ChartTitle(text: '전체 회원 현황', textStyle: TextStyle(
              //               fontSize: 14.0,
              //               fontFamily: 'NanumSquareEB',
              //             )),
              //             legend: Legend(isVisible: true),
              //             series: <PieSeries<Settings2, String>>[
              //               PieSeries<Settings2, String>(
              //                   explode: true,
              //                   explodeIndex: 0,
              //                   dataSource: setting2,
              //                   xValueMapper: (Settings2 setting2, _) => setting2.month,
              //                   yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
              //                   dataLabelMapper: (Settings2 setting2, _) => setting2.month+'월',
              //                   dataLabelSettings: DataLabelSettings(isVisible: true)),
              //             ]
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Container(
              width: Get.width,
              height: 80,
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 30,
                bottom: MediaQuery.of(context).size.width / 100,
              ),
              child: Row(
                children: const [
                  Icon(Icons.arrow_right),
                  Text(
                    '설정 관리',
                    style: TextStyle(
                      fontFamily: 'NanumSquareEB',
                      fontSize: 18,
                    ),
                  ),
                ],
              )),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
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
                          content: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    leading: Icon(Icons.list),
                                    trailing: Text(
                                      "GFG",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    title: Text("List item $index"));
                              }),
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
                      padding: const EdgeInsets.all(5),
                      width: 300,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 50.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.0, color: const Color(0xFFe6e6e6))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('쿠폰 내역 확인',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                  fontFamily: 'NanumSquareEB',
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 70,
                            ),
                            const Text(
                              '쿠폰 내역을 확인할 수 있습니다',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                                fontFamily: 'NanumSquareR',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      width: 300,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 50.0, horizontal: 30.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1.0, color: const Color(0xFFe6e6e6))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('배너 설정',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black,
                                  fontFamily: 'NanumSquareEB',
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 70,
                            ),
                            const Text(
                              '배너를 변경할 수 있습니다',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey,
                                fontFamily: 'NanumSquareR',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 300,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 50.0, horizontal: 30.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 1.0, color: const Color(0xFFe6e6e6))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('기타 설정',
                              style: TextStyle(
                                fontSize: 17.0,
                                color: Colors.black,
                                fontFamily: 'NanumSquareEB',
                              )),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 70,
                          ),
                          const Text(
                            '기타 설정을 변경할 수 있습니다',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontFamily: 'NanumSquareR',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
            ],
          ),
          const SizedBox(
            height: 100.0,
          )
        ],
      ),
    );
  }
}
