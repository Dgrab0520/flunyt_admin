import 'package:flunyt_admin/admin/data/setting_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../model/top_category_model.dart';

class TopCategory extends StatefulWidget {
  const TopCategory({Key? key}) : super(key: key);

  @override
  _TopCategoryState createState() => _TopCategoryState();
}

class _TopCategoryState extends State<TopCategory> {
  @override
  void initState() {
    Get.find<SettingPageController>().getTopCategory().then((value) {
      if (value) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        title: ChartTitle(
            text: '카테고리 Top 5',
            textStyle: const TextStyle(
              fontSize: 14.0,
              fontFamily: 'NanumSquareEB',
            )),
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(),
        series: <ChartSeries<TopCategoryModel, String>>[
          // Renders column chart
          BarSeries<TopCategoryModel, String>(
            // color: Color(0xFF506AB4),
            dataSource: Get.find<SettingPageController>().topCategory,
            xValueMapper: (TopCategoryModel category, _) =>
                category.categoryName,
            yValueMapper: (TopCategoryModel category, _) => category.count,
          ),
        ]);
  }
}
