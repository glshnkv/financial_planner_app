import 'package:financial_planner_app/screens/analytics/bloc/analytics_bloc.dart';
import 'package:financial_planner_app/screens/analytics/charts_widget/month_bar_widget.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MonthTab extends StatefulWidget {
  const MonthTab({super.key});

  @override
  State<MonthTab> createState() => _MonthTabState();
}

class _MonthTabState extends State<MonthTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: BlocProvider(
        create: (context) => AnalyticsBloc()..add(GetMonthAnalyticsEvent()),
        child: BlocConsumer<AnalyticsBloc, AnalyticsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadedMonthAnalyticsState) {
              return Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    MonthChartWidget(monthData: state.monthAnalytics, maxAmount: state.maxIncome),
                    SizedBox(height: 25),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          border: Border.all(color: Colors.transparent),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16.0))),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Общая сумма',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${state.totalIncome - state.totalSpend} ₽',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.darkBlue,
                          border: Border.all(color: Colors.transparent),
                          borderRadius:
                          BorderRadius.all(Radius.circular(16.0))),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Доходы',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '${state.totalIncome} ₽',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: AppColors.blue, height: 2,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Расходы',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '-${state.totalSpend} ₽',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
