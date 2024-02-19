import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mortgage_calculator_event.dart';
part 'mortgage_calculator_state.dart';

class MortgageCalculatorBloc
    extends Bloc<MortgageCalculatorEvent, MortgageCalculatorState> {
  MortgageCalculatorBloc() : super(MortgageCalculatorInitial()) {
    on<CalculateMortgageEvent>(_calculateMortgageEvent);
  }

  void _calculateMortgageEvent(CalculateMortgageEvent event,
      Emitter<MortgageCalculatorState> emit) async {
    double loanAmount = event.propertyValue - event.initialFee;
    double monthlyRate = event.rate / 12 / 100;
    int numberOfPayments = event.term * 12;

    double monthlyPayment = loanAmount *
        monthlyRate *
        pow(1 + monthlyRate, numberOfPayments) /
        (pow(1 + monthlyRate, numberOfPayments) - 1);

    double overPayment =
        monthlyPayment * (event.term * 12) - event.propertyValue + event.initialFee;
    double finalPayment = monthlyPayment * (event.term * 12);

    double percentLoanAmount = loanAmount / finalPayment;
    double percentOverAmount = overPayment / finalPayment;

    emit(CalculatedMortgageState(
        loanAmount: loanAmount,
        overPayment: overPayment,
        monthlyPayment: monthlyPayment,
        finalPayment: finalPayment, percentLoanAmount: percentLoanAmount, percentOverAmount: percentOverAmount));
  }
}
