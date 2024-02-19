part of 'finance_bloc.dart';

@immutable
abstract class FinanceState {}

class FinanceInitial extends FinanceState {}

class LoadedIncomeBillsState extends FinanceState {
  final List<BillModel> incomeBills;

  LoadedIncomeBillsState({required this.incomeBills});
}

class LoadedSpendBillsState extends FinanceState {
  final List<BillModel> spendBills;

  LoadedSpendBillsState({required this.spendBills});
}

class LoadedTotalAmountState extends FinanceState {
  final double totalAmount;

  LoadedTotalAmountState({required this.totalAmount});
}
