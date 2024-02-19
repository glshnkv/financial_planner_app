import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/router/router.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:financial_planner_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/onboarding/image.png'),
                SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: Text(
                    'Добро пожаловать в Financial Planner!',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Здесь вы сможете легко рассчитать стоимость ипотеки и создать финансовый план на будущее.',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 25),
                Align(
                    alignment: Alignment.center,
                    child: ActionButtonWidget(
                      text: 'Начать',
                      onTap: () {
                        context.router.push(MainRoute());
                      },
                      width: 370,
                    ),),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Условия использования',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Политика конфиденциальности',
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
