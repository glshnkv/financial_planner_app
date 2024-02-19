import 'package:financial_planner_app/screens/analytics/charts_widget/week_bar_widget.dart';
import 'package:financial_planner_app/screens/analytics/tabs/day_tab.dart';
import 'package:financial_planner_app/screens/analytics/tabs/month_tab.dart';
import 'package:financial_planner_app/screens/analytics/tabs/week_tab.dart';
import 'package:financial_planner_app/screens/analytics/tabs/year_tab.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.blue,
        appBar: AppBar(
          bottom: TabBar(
            dividerColor: AppColors.blue,
            indicatorColor: AppColors.white,
            labelColor: AppColors.white,
            unselectedLabelColor: AppColors.grey,
            tabs: [
              Tab(child: Text('Сегодня', style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16),)),
              Tab(child: Text('Неделя', style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 16),)),
              Tab(child: Text('Месяц', style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 16),)),
              Tab(child: Text('Год', style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 16),)),
            ],
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blue,
          title: Text('Аналитика', style: TextStyle(
            color: AppColors.white,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),)
        ),
        body: TabBarView(
          children: [
            DayTab(),
            WeekTab(),
            MonthTab(),
            YearTab(),
          ],
        ),
      ),
    );
  }
}
