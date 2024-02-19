import 'package:financial_planner_app/screens/analytics/charts_data/year_bar_data.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class YearChartWidget extends StatelessWidget {
  final List yearData;
  final double maxAmount;

  const YearChartWidget({super.key, required this.yearData, required this.maxAmount});

  @override
  Widget build(BuildContext context) {
    YearBarData yearBarData = YearBarData(
        firstAmount: yearData[0],
        secondAmount: yearData[1],
        thirdAmount: yearData[2],
        fourthAmount: yearData[3],
        fifthAmount: yearData[4],
        sixthAmount: yearData[5],
        seventhAmount: yearData[6],
        eighthAmount: yearData[7],
        ninthAmount: yearData[8],
        tenthAmount: yearData[9],
        eleventhAmount: yearData[10],
        twelfthAmount: yearData[11]);

    yearBarData.initializeYearBarData();

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
            barGroups: yearBarData.yearBarData
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
