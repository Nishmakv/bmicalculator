import 'package:bloc/bloc.dart';
import 'package:bmicalculator/enum/body_change.dart';
import 'package:bmicalculator/enum/gender_type.dart';
part 'calculation_event.dart';
part 'calculation_state.dart';

class CalculationBloc extends Bloc<CalculatorEvent, CalculateState> {
  CalculationBloc() : super(CalculateState.initial()) {
    on<BmiCalculator>(calculation);
    on<SliderEvent>(slide);
    on<WeightChangeEvent>(weightChange);
    on<AgeChangeEvent>(ageChange);
    on<GenderChange>(genderChange);
  }

  void calculation(
    BmiCalculator event,
    Emitter<CalculateState> emit,
  ) async {
    emit(state.copyWith(status: CalculateStatus.loading));

    final calculation = bmi(event.height, event.weight);

    emit(state.copyWith(result: calculation));
  }

  double bmi(double height, double weight) {
    if (height > 0) {
      final convertedHeight = height / 100;
      return weight / (convertedHeight * convertedHeight);
    } else {
      throw ArgumentError("Height must be greater than zero");
    }
  }

  Future<void> slide(
    SliderEvent event,
    Emitter<CalculateState> emit,
  ) async {
    emit(state.copyWith(status: CalculateStatus.loading));

    emit(state.copyWith(sliderValue: event.value));
  }

  Future<void> weightChange(
    WeightChangeEvent event,
    Emitter<CalculateState> emit,
  ) async {
    emit(state.copyWith(status: CalculateStatus.loading));

    double currentWeight = state.weight;

    if (event.type == WeightChangeType.increment) {
      currentWeight++;
    }
    if (event.type == WeightChangeType.decrement) {
      currentWeight--;
    }

    emit(state.copyWith(weight: currentWeight));
  }

  Future<void> ageChange(
    AgeChangeEvent event,
    Emitter<CalculateState> emit,
  ) async {
    emit(state.copyWith(status: CalculateStatus.loading));

    int currentAge = state.age;
    if (event.type == WeightChangeType.increment) {
      currentAge++;
    }
    if (event.type == WeightChangeType.decrement) {
      currentAge--;
    }
    emit(state.copyWith(age: currentAge));
  }

  void genderChange(
    GenderChange event,
    Emitter<CalculateState> emit,
  ) {
    emit(state.copyWith(status: CalculateStatus.loading));
    emit(state.copyWith(status: CalculateStatus.loading, gender: event.type));
  }
}
