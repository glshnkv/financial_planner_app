import 'package:auto_route/auto_route.dart';
import 'package:financial_planner_app/router/router.dart';
import 'package:financial_planner_app/screens/mortgage_calculator/bloc/mortgage_calculator_bloc.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

@RoutePage()
class MortgageResultScreen extends StatefulWidget {
  final double propertyValue;
  final double initialFee;
  final int term;
  final double rate;

  const MortgageResultScreen(
      {super.key,
      required this.propertyValue,
      required this.initialFee,
      required this.term,
      required this.rate});

  @override
  State<MortgageResultScreen> createState() => _MortgageResultScreenState();
}

class _MortgageResultScreenState extends State<MortgageResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Ипотечный калькулятор рассчитал',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.popAndPush(MainRoute());
                      },
                      child: SvgPicture.asset(
                          'assets/images/elements/close-button.svg'),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                BlocProvider(
                  create: (context) => MortgageCalculatorBloc()
                    ..add(CalculateMortgageEvent(
                        propertyValue: widget.propertyValue,
                        initialFee: widget.initialFee,
                        term: widget.term,
                        rate: widget.rate)),
                  child: BlocConsumer<MortgageCalculatorBloc,
                      MortgageCalculatorState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is CalculatedMortgageState) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Процентная ставка',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            LinearPercentIndicator(
                                animation: true,
                                lineHeight: 30.0,
                                animationDuration: 2000,
                                percent: state.percentOverAmount,
                                center: Text(
                                  "${(state.percentOverAmount * 100).toStringAsFixed(0)}%",
                                  style: TextStyle(
                                    color: (int.parse(
                                                (state.percentOverAmount * 100)
                                                    .toStringAsFixed(0)) >=
                                            60)
                                        ? AppColors.darkBlue
                                        : AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                barRadius: Radius.circular(8),
                                progressColor: AppColors.white,
                                backgroundColor: AppColors.darkBlue),
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Основной долг',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            LinearPercentIndicator(
                                animation: true,
                                lineHeight: 30.0,
                                animationDuration: 2000,
                                percent: state.percentLoanAmount,
                                center: Text(
                                  "${(state.percentLoanAmount * 100).toStringAsFixed(0)}%",
                                  style: TextStyle(
                                    color: (int.parse(
                                                (state.percentLoanAmount * 100)
                                                    .toStringAsFixed(0)) >=
                                            60)
                                        ? AppColors.darkBlue
                                        : AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                barRadius: Radius.circular(8),
                                progressColor: AppColors.white,
                                backgroundColor: AppColors.darkBlue),
                            SizedBox(height: 30),
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
                                          'Основной долг',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '${state.loanAmount.toStringAsFixed(0)} ₽',
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
                                          'Процентная ставка',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '${state.overPayment.toStringAsFixed(2)} ₽',
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
                            SizedBox(height: 20),
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
                                          'Ежемесячно оплата',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '${state.monthlyPayment.toStringAsFixed(2)} ₽',
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
                                          'Начисленные проценты',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '${state.overPayment.toStringAsFixed(2)} ₽',
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
                                          'Долг + проценты',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '${state.finalPayment.toStringAsFixed(2)} ₽',
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
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
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
