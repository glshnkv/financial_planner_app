import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/router/router.dart';
import 'package:financial_planner_app/screens/mortgage_calculator/bloc/mortgage_calculator_bloc.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:financial_planner_app/widgets/action_button_widget.dart';
import 'package:financial_planner_app/widgets/textfield_app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

@RoutePage()
class MortgageCalculatorScreen extends StatefulWidget {
  const MortgageCalculatorScreen({super.key});

  @override
  State<MortgageCalculatorScreen> createState() =>
      _MortgageCalculatorScreenState();
}

class _MortgageCalculatorScreenState extends State<MortgageCalculatorScreen> {
  final costController = TextEditingController();
  final initialFeeController = TextEditingController();
  final termController = TextEditingController();
  final rateController = TextEditingController();

  @override
  void dispose() {
    costController.dispose();
    initialFeeController.dispose();
    termController.dispose();
    rateController.dispose();
    super.dispose();
  }

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
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'Ипотечный калькулятор',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                TextFieldAppWidget(
                    controller: costController,
                    hintText: '',
                    title: 'Стоимость имущества, ₽'),
                SizedBox(height: 15),
                TextFieldAppWidget(
                    controller: initialFeeController,
                    hintText: '',
                    title: 'Первоначальный взнос, ₽'),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 200,
                        child: TextFieldAppWidget(
                            controller: termController,
                            hintText: '',
                            title: 'Срок, Лет')),
                    Container(
                      width: 150,
                      child: TextFieldAppWidget(
                          controller: rateController,
                          hintText: '',
                          title: 'Ставка, %'),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                ActionButtonWidget(
                    text: 'Рассчитать',
                    width: 375,
                    onTap: () {
                      if (costController.text != '' ||
                          initialFeeController.text != '' ||
                          termController.text != '' ||
                          rateController.text != '') {
                        context.router.push(MortgageResultRoute(propertyValue: double.parse(costController.text),
                        initialFee: double.parse(initialFeeController.text),
                        term: int.parse(termController.text),
                        rate: double.parse(rateController.text)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.darkBlue,
                            content: Text(
                              'Необходимо заполнить все поля',
                              style: TextStyle(color: AppColors.white),
                            ),
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
