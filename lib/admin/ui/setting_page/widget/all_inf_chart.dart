import 'package:flunyt_admin/admin/data/setting_page_controller.dart';
import 'package:flunyt_admin/admin/model/user_total_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AllInfChart extends StatefulWidget {
  const AllInfChart({Key? key}) : super(key: key);

  @override
  _AllInfChartState createState() => _AllInfChartState();
}

class _AllInfChartState extends State<AllInfChart> {
  @override
  void initState() {
    Get.find<SettingPageController>().getUserTotal().then((value) {
      if (value) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        title: ChartTitle(
            text: '전체 인플루언서 현황',
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'NanumSquareEB',
            )),
        legend: Legend(isVisible: true),
        series: <PieSeries<UserTotal, String>>[
          PieSeries<UserTotal, String>(
              explode: true,
              explodeIndex: 0,
              dataSource: Get.find<SettingPageController>().userList,
              xValueMapper: (UserTotal member, _) => member.name,
              yValueMapper: (UserTotal member, _) => member.count,
              dataLabelMapper: (UserTotal member, _) => member.count.toString(),
              dataLabelSettings: const DataLabelSettings(isVisible: true)),
        ]);
  }
}
