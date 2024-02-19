part of 'mortgage_calculator_bloc.dart';

@immutable
abstract class MortgageCalculatorEvent {}

class CalculateMortgageEvent extends MortgageCalculatorEvent {
  final double propertyValue;
  final double initialFee;
  final int term;
  final double rate;

  CalculateMortgageEvent(
      {required this.propertyValue,
        required this.initialFee,
        required this.term,
        required this.rate});
}