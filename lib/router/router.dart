import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/models/news_model.dart';
import 'package:financial_planner_app/screens/finance/finance_screen.dart';
import 'package:financial_planner_app/screens/main/main_screen.dart';
import 'package:financial_planner_app/screens/mortgage_calculator/mortgage_calculator_screen.dart';
import 'package:financial_planner_app/screens/mortgage_calculator/mortgage_result_screen.dart';
import 'package:financial_planner_app/screens/news/news_info_screen.dart';
import 'package:financial_planner_app/screens/news/news_list_screen.dart';
import 'package:financial_planner_app/screens/onboarding/onboarding_screen.dart';
import 'package:financial_planner_app/screens/settings/settings_screen.dart';

import 'package:flutter/material.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: OnboardingRoute.page, initial: true),
    AutoRoute(page: FinanceRoute.page),
    AutoRoute(page: MainRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: MortgageResultRoute.page),
    AutoRoute(page: NewsListRoute.page),
    AutoRoute(page: NewsInfoRoute.page),
  ];
}