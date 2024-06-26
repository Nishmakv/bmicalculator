part of 'calculation_bloc.dart';

enum CalculateStatus {
  initial,
  loading,
  error;
}

class CalculateState {
  final CalculateStatus? status;
  final double? result;
  final double sliderValue;
  final double weight;
  final int age;
  final Gender? gender;

  CalculateState({
    this.status,
    this.result,
    this.sliderValue = 0,
    this.weight = 0,
    this.age = 0,
    this.gender,
  });

  factory CalculateState.initial() {
    return CalculateState(
      status: CalculateStatus.initial,
    );
  }

  CalculateState copyWith({
    CalculateStatus? status,
    double? result,
    double? sliderValue,
    double? weight,
    int? age,
    Gender? gender,
  }) {
    return CalculateState(
      status: status,
      result: result ?? this.result,
      sliderValue: sliderValue ?? this.sliderValue,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      gender: gender ?? this.gender,
    );
  }
}
