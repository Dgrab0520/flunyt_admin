import 'package:data_table_2/data_table_2.dart';
import 'package:flunyt_admin/admin/data/setting_page_controller.dart';
import 'package:flunyt_admin/admin/ui/widget/category_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BigScreen extends StatelessWidget {
  BigScreen({Key? key}) : super(key: key);

  final settingPageController = Get.put(SettingPageController());
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
                            SizedBox(
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
                            SizedBox(
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
                      children: [
                        const Text(
                          '월별 이용현황',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        const SizedBox(height: 30),
                        // SizedBox(
                        //   height: 410,
                        //   child: SfCartesianChart(
                        //       primaryXAxis: CategoryAxis(),
                        //       primaryYAxis: NumericAxis(),
                        //       series: <ChartSeries<Settings2, String>>[
                        //         // Renders column chart
                        //         ColumnSeries<Settings2, String>(
                        //           color: const Color(0xFF506AB4),
                        //           dataSource: setting2,
                        //           xValueMapper: (Settings2 setting2, _) =>
                        //               setting2.month + '월',
                        //           yValueMapper: (Settings2 setting2, _) =>
                        //               int.parse(setting2.count),
                        //         ),
                        //       ]),
                        // ),
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
                    children: [
                      const SizedBox(height: 15),
                      // SfCircularChart(
                      //     title: ChartTitle(
                      //         text: '전체 인플루언서 현황',
                      //         textStyle: const TextStyle(
                      //           fontSize: 14.0,
                      //           fontFamily: 'NanumSquareEB',
                      //         )),
                      //     legend: Legend(isVisible: true),
                      //     series: <PieSeries<MemberData, String>>[
                      //       PieSeries<MemberData, String>(
                      //           explode: true,
                      //           explodeIndex: 0,
                      //           dataSource: chartData,
                      //           xValueMapper: (MemberData member, _) =>
                      //               member.type,
                      //           yValueMapper: (MemberData member, _) =>
                      //               member.count,
                      //           dataLabelMapper: (MemberData member, _) =>
                      //               member.type,
                      //           dataLabelSettings:
                      //               const DataLabelSettings(isVisible: true)),
                      //     ])
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
                    children: [
                      const SizedBox(height: 15),
                      // SfCircularChart(
                      //     title: ChartTitle(
                      //         text: '업체 현황',
                      //         textStyle: const TextStyle(
                      //           fontSize: 14.0,
                      //           fontFamily: 'NanumSquareEB',
                      //         )),
                      //     legend: Legend(isVisible: true),
                      //     series: <PieSeries<Settings3, String>>[
                      //       PieSeries<Settings3, String>(
                      //           explode: true,
                      //           explodeIndex: 0,
                      //           dataSource: setting3,
                      //           xValueMapper: (Settings3 setting3, _) =>
                      //               setting3.index == '' ? '일반 업체' : '제휴 업체',
                      //           yValueMapper: (Settings3 setting3, _) =>
                      //               int.parse(setting3.count),
                      //           dataLabelMapper: (Settings3 setting3, _) =>
                      //               setting3.index == '' ? '일반 업체' : '제휴 업체',
                      //           dataLabelSettings:
                      //               const DataLabelSettings(isVisible: true)),
                      //     ])
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
                    children: [
                      const SizedBox(height: 15),
                      // SfCartesianChart(
                      //     title: ChartTitle(
                      //         text: '카테고리 Top 5',
                      //         textStyle: const TextStyle(
                      //           fontSize: 14.0,
                      //           fontFamily: 'NanumSquareEB',
                      //         )),
                      //     primaryXAxis: CategoryAxis(),
                      //     primaryYAxis: NumericAxis(),
                      //     series: <ChartSeries<Settings5, String>>[
                      //       // Renders column chart
                      //       BarSeries<Settings5, String>(
                      //         // color: Color(0xFF506AB4),
                      //         dataSource: setting5,
                      //         xValueMapper: (Settings5 setting5, _) =>
                      //             setting5.service,
                      //         yValueMapper: (Settings5 setting5, _) =>
                      //             int.parse(setting5.count),
                      //       ),
                      //     ]),
                      // SfCircularChart(
                      //     title: ChartTitle(text: '파트너 분야', textStyle: TextStyle(
                      //       fontSize: 14.0,
                      //       fontFamily: 'NanumSquareEB',
                      //     )),
                      //     legend: Legend(isVisible: true),
                      //     series: <PieSeries<Settings2, String>>[
                      //       PieSeries<Settings2, String>(
                      //           explode: true,
                      //           explodeIndex: 0,
                      //           dataSource: setting2,
                      //           xValueMapper: (Settings2 setting2, _) => setting2.month,
                      //           yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                      //           dataLabelMapper: (Settings2 setting2, _) => setting2.month+'월 : ${setting2.count}',
                      //           dataLabelSettings: DataLabelSettings(isVisible: true)),
                      //     ]
                      // )
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
