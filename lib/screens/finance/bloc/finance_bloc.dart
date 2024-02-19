import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:financial_planner_app/models/bill_model.dart';
import 'package:financial_planner_app/services/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'finance_event.dart';

part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitial()) {
    on<GetIncomeBillsEvent>(_getIncomeBillsHandler);
    on<GetSpendBillsEvent>(_getSpendBillsHandler);
    on<AddIncomeBillEvent>(_addIncomeBillHandler);
    on<AddSpendBillEvent>(_addSpendBillHandler);
    on<GetTotalAmountEvent>(_getTotalAmountHandler);
    on<ResetEvent>(_resetHandler);
  }

  void _getIncomeBillsHandler(
      GetIncomeBillsEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    final List<BillModel> _incomeBills =
        convertStringListToBillModelList(storage.incomeBills);
    emit(LoadedIncomeBillsState(incomeBills: _incomeBills));
  }

  void _getSpendBillsHandler(
      GetSpendBillsEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    final List<BillModel> _spendBills =
        convertStringListToBillModelList(storage.spendBills);
    emit(LoadedSpendBillsState(spendBills: _spendBills));
  }

  void _addIncomeBillHandler(
      AddIncomeBillEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    final String incomeBillString =
        "Value: ${event.incomeBill.value}, Comment: ${event.incomeBill.comment}, Date: ${event.incomeBill.date}, Type: ${event.incomeBill.type}";

    final List<String> _incomeBills = storage.incomeBills;
    _incomeBills.add(incomeBillString);
    storage.incomeBills = _incomeBills;

    storage.totalAmount += event.incomeBill.value;

    emit(LoadedIncomeBillsState(
        incomeBills: convertStringListToBillModelList(storage.incomeBills)));
  }

  void _addSpendBillHandler(
      AddSpendBillEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    final String spendBillString =
        "Value: ${event.spendBill.value}, Comment: ${event.spendBill.comment}, Date: ${event.spendBill.date}, Type: ${event.spendBill.type}";

    final List<String> _spendBills = storage.spendBills;
    _spendBills.add(spendBillString);
    storage.spendBills = _spendBills;

    storage.totalAmount -= event.spendBill.value;

    emit(LoadedSpendBillsState(
        spendBills: convertStringListToBillModelList(storage.spendBills)));
  }

  void _getTotalAmountHandler(
      GetTotalAmountEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();

    emit(LoadedTotalAmountState(totalAmount: storage.totalAmount));
  }

  void _resetHandler(
      ResetEvent event, Emitter<FinanceState> emit) async {
    SharedPreferencesService storage =
    await SharedPreferencesService.getInstance();

    storage.totalAmount = 0;
    storage.incomeBills = [];
    storage.spendBills = [];
  }

  List<BillModel> convertStringListToBillModelList(List<String> stringList) {
    List<BillModel> billModels = [];
    for (String billString in stringList) {
      List<String> parts = billString.split(', ');

      double value = double.parse(parts[0].split(': ')[1]);
      String comment = parts[1].split(': ')[1];
      DateTime date = DateTime.parse(parts[2].split(': ')[1]);
      String type = parts[3].split(': ')[1];

      BillModel billModel =
          BillModel(value: value, comment: comment, date: date, type: type);
      billModels.add(billModel);
    }
    return billModels;
  }
}
