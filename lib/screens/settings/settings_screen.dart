import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/router/router.dart';
import 'package:financial_planner_app/screens/finance/bloc/finance_bloc.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Настройки',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {
                    context.read<FinanceBloc>().add(ResetEvent());
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.darkBlue,
                        content: Text(
                          'Финансы успешно сброшены!',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    );
                    context.router.push(MainRoute());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/settings/restart.svg',
                              color: AppColors.white),
                          SizedBox(width: 6),
                          Text(
                            'Сбросить сумму',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  tileColor: AppColors.darkBlue,
                  leading: SvgPicture.asset('assets/images/settings/share.svg',
                      color: AppColors.white),
                  title: Text(
                    'Поделиться с друзьями',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: SvgPicture.asset('assets/images/settings/arrow.svg',
                      color: AppColors.white),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  tileColor: AppColors.darkBlue,
                  leading: SvgPicture.asset('assets/images/settings/security.svg',
                      color: AppColors.white),
                  title: Text(
                    'Политика конфиденциальности',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: SvgPicture.asset('assets/images/settings/arrow.svg',
                      color: AppColors.white),
                ),
                SizedBox(height: 15),
                ListTile(
                  onTap: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  tileColor: AppColors.darkBlue,
                  leading: SvgPicture.asset('assets/images/settings/paper.svg',
                      color: AppColors.white),
                  title: Text(
                    'Условия эксплуатации',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: SvgPicture.asset('assets/images/settings/arrow.svg',
                      color: AppColors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
