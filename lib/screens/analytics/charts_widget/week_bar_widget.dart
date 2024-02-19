import 'package:financial_planner_app/screens/analytics/charts_data/week_bar_data.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeekChartWidget extends StatelessWidget {
  final List weekData;
  final double maxAmount;

  const WeekChartWidget({super.key, required this.weekData, required this.maxAmount});

  @override
  Widget build(BuildContext context) {
    WeekBarData weekBarData = WeekBarData(
        mondayAmount: weekData[0],
        tuesdayAmount: weekData[1],
        wednesdayAmount: weekData[2],
        thursdayAmount: weekData[3],
        fridayAmount: weekData[4],
        saturdayAmount: weekData[5],
        sundayAmount: weekData[6]);

    weekBarData.initializeWeekBarData();

    return Center(
      child: Container(
        height: 350,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        decoration: BoxDecoration(
            color: AppColors.darkBlue,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: false),
            maxY: 100,
            minY: 0,
            barGroups: weekBarData.weekBarData
                .map(
                  (data) => BarChartGroupData(
                    x: data.x,
                    barRods: [
                      BarChartRodData(
                          toY: data.y <= 0 ? 1 : data.y / maxAmount * 100,
                          color: AppColors.white,
                          width: 30,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
