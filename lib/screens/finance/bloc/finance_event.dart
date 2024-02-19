part of 'finance_bloc.dart';

@immutable
abstract class FinanceEvent {}

class GetIncomeBillsEvent extends FinanceEvent {}

class GetSpendBillsEvent extends FinanceEvent {}

class AddIncomeBillEvent extends FinanceEvent {
  final BillModel incomeBill;

  AddIncomeBillEvent({required this.incomeBill});
}

class AddSpendBillEvent extends FinanceEvent {
  final BillModel spendBill;

  AddSpendBillEvent({required this.spendBill});
}

class GetTotalAmountEvent extends FinanceEvent {}

class ResetEvent extends FinanceEvent {}