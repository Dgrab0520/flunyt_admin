import 'package:flunyt_admin/admin/model/top_saved_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../data/setting_page_controller.dart';

class TopSaved extends StatefulWidget {
  const TopSaved({Key? key}) : super(key: key);

  @override
  _TopSavedState createState() => _TopSavedState();
}

class _TopSavedState extends State<TopSaved> {

  @override
  void initState() {
    Get.find<SettingPageController>().getTopSaved().then((value){
      if(value){
        setState(() {

        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(
            text: '저장된 장소 Top 5',
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'NanumSquareEB',
            )),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries<TopSavedModel, String>>[
          // Renders column chart
          ColumnSeries<TopSavedModel, String>(
            color: const Color(0xFF506AB4),
            dataSource: Get.find<SettingPageController>().topSaved,
            xValueMapper: (TopSavedModel saved, _) => saved.placeName,
            yValueMapper: (TopSavedModel saved, _) => saved.count,
          ),
        ]);
  }
}
