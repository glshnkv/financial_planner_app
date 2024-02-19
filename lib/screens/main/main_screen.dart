import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/screens/finance/finance_screen.dart';
import 'package:financial_planner_app/screens/mortgage_calculator/mortgage_calculator_screen.dart';
import 'package:financial_planner_app/screens/settings/settings_screen.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final _tabs = [FinanceScreen(), FinanceScreen(), MortgageCalculatorScreen(), FinanceScreen(), SettingsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          iconTheme: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const IconThemeData(color: AppColors.white);
            } else {
              return const IconThemeData(color: AppColors.grey);
            }
          }),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white);
            }
            return const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: AppColors.grey);
          }),
        ),
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedIndex: _currentIndex,
          backgroundColor: AppColors.darkBlue,
          indicatorColor: Colors.transparent,
          destinations: [
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/home.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/home.svg', color: AppColors.grey),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/analytics.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/analytics.svg', color: AppColors.grey),
              label: 'Аналитика',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/calculator.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/calculator.svg', color: AppColors.grey),
              label: 'Калькулятор',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/news.svg', color: AppColors.grey),
              label: 'Новости',
            ),
            NavigationDestination(
              selectedIcon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.white),
              icon: SvgPicture.asset('assets/images/tab-icons/settings.svg', color: AppColors.grey),
              label: 'Настройки',
            ),
          ],
        ),
      ),
    );
  }
}
