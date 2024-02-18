import 'package:flutter/material.dart';
import 'package:financial_planner_app/router/router.dart';

class FinancialPlannerApp extends StatelessWidget {
  FinancialPlannerApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
