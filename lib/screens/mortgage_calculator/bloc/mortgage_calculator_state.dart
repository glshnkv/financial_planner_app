part of 'mortgage_calculator_bloc.dart';

@immutable
abstract class MortgageCalculatorState {}

class MortgageCalculatorInitial extends MortgageCalculatorState {}

class CalculatedMortgageState extends MortgageCalculatorState {
  final double loanAmount;
  final double overPayment;
  final double monthlyPayment;
  final double finalPayment;
  final double percentLoanAmount;
  final double percentOverAmount;

  CalculatedMortgageState({
    required this.loanAmount,
    required this.overPayment,
    required this.monthlyPayment,
    required this.finalPayment,
    required this.percentLoanAmount,
    required this.percentOverAmount,
  });
}
