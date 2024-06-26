part of 'calculation_bloc.dart';

abstract class CalculatorEvent {
  const CalculatorEvent();

  List<Object?> get props => [];
}

class BmiCalculator extends CalculatorEvent {
  final double height;
  final double weight;
  const BmiCalculator({
    required this.height,
    required this.weight,
  });
  @override
  List<Object?> get props => [];
}

class SliderEvent extends CalculatorEvent {
  final double value;
  const SliderEvent({
    required this.value,
  });
}

class WeightChangeEvent extends CalculatorEvent {
  final WeightChangeType type;
  const WeightChangeEvent({
    required this.type,
  });
}

class AgeChangeEvent extends CalculatorEvent {
  final WeightChangeType type;
  const AgeChangeEvent({
    required this.type,
  });
}

class GenderChange extends CalculatorEvent {
  final Gender type;
  const GenderChange({
    required this.type,
  });
}

// class IsMaleSelect extends CalculatorEvent {
//   final bool isSelect;
//   const IsMaleSelect({
//     required this.isSelect,
//   });
// }

// class IsFemaleSelect extends CalculatorEvent {
//   final bool isSelect;
//   const IsFemaleSelect({
//     required this.isSelect,
//   });
// }
