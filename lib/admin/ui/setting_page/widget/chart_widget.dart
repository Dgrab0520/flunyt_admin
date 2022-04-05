import 'package:flunyt_admin/admin/data/setting_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/month_count_model.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  void initState() {
    Get.find<SettingPageController>().getMonthCount().then((value){
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
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries<MonthCount, String>>[
          // Renders column chart
          ColumnSeries<MonthCount, String>(
            color: const Color(0xFF506AB4),
            dataSource: Get.find<SettingPageController>().monthList,
            xValueMapper: (MonthCount month, _) => month.month + '월',
            yValueMapper: (MonthCount month, _) => month.count,
          ),
        ]);
  }
}
