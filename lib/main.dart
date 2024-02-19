import 'package:financial_planner_app/financial_planner_app.dart';
import 'package:financial_planner_app/screens/analytics/bloc/analytics_bloc.dart';
import 'package:financial_planner_app/screens/finance/bloc/finance_bloc.dart';
import 'package:financial_planner_app/screens/mortgage_calculator/bloc/mortgage_calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<MortgageCalculatorBloc>(
          create: (context) => MortgageCalculatorBloc()),
      BlocProvider<FinanceBloc>(
          create: (context) => FinanceBloc()),
      BlocProvider<AnalyticsBloc>(
          create: (context) => AnalyticsBloc()),
    ],
    child: FinancialPlannerApp(),
  ));

}
