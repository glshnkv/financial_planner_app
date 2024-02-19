import 'package:financial_planner_app/screens/analytics/charts_data/day_bar_data.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DayChartWidget extends StatelessWidget {
  final List dayData;
  final double maxAmount;

  const DayChartWidget({super.key, required this.dayData, required this.maxAmount});

  @override
  Widget build(BuildContext context) {
    DayBarData dayBarData = DayBarData(
        firstAmount: dayData[0],
        secondAmount: dayData[1],
        thirdAmount: dayData[2],
        fourthAmount: dayData[3],
        fifthAmount: dayData[4],
        sixthAmount: dayData[5],
        seventhAmount: dayData[6],
        eighthAmount: dayData[7],
        ninthAmount: dayData[8],
        tenthAmount: dayData[9],
        eleventhAmount: dayData[10],
        twelfthAmount: dayData[11]);

    dayBarData.initializeDayBarData();

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
            barGroups: dayBarData.dayBarData
                .map(
                  (data) => BarChartGroupData(
                x: data.x,
                barRods: [
                  BarChartRodData(
                      toY: data.y <= 0 ? 1 : data.y / maxAmount * 100,
                      color: AppColors.white,
                      width: 20,
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
