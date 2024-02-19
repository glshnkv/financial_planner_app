import 'package:financial_planner_app/models/bill_model.dart';
import 'package:financial_planner_app/screens/finance/bloc/finance_bloc.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpendTab extends StatefulWidget {
  const SpendTab({super.key});

  @override
  State<SpendTab> createState() => _SpendTabState();
}

class _SpendTabState extends State<SpendTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: BlocProvider(
        create: (context) => FinanceBloc()..add(GetSpendBillsEvent()),
        child: BlocBuilder<FinanceBloc, FinanceState>(
          builder: (context, state) {
            if (state is LoadedSpendBillsState) {
              if (state.spendBills.length != 0) {
                state.spendBills.sort((a, b) => a.date.compareTo(b.date));
                final List<BillModel> _spendBills = List.from(state.spendBills.reversed);
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.spendBills.length,
                    reverse: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(height: 15),
                    itemBuilder: (BuildContext context, int index) {
                      final spendBill = _spendBills[index];
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            border: Border.all(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${spendBill.type}',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${spendBill.comment}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${spendBill.value} ₽',
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${spendBill.date.day}-${spendBill.date.month}-${spendBill.date.year}',
                                  style: TextStyle(
                                    color: AppColors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Информации о расходах пока нет, нажмите кнопку "Добавить", что бы добавить расход.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
