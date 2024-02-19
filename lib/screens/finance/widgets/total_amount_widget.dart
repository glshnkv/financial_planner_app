import 'package:financial_planner_app/screens/finance/bloc/finance_bloc.dart';
import 'package:financial_planner_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalAmountWidget extends StatefulWidget {
  const TotalAmountWidget({super.key});

  @override
  State<TotalAmountWidget> createState() => _TotalAmountWidgetState();
}

class _TotalAmountWidgetState extends State<TotalAmountWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinanceBloc()..add(GetTotalAmountEvent()),
      child: BlocConsumer<FinanceBloc, FinanceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadedTotalAmountState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Общая сумма',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '${state.totalAmount} ₽',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
