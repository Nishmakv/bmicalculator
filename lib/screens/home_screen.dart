import 'package:bmicalculator/bloc/calculation_bloc.dart';
import 'package:bmicalculator/enum/body_change.dart';
import 'package:bmicalculator/enum/gender_type.dart';
import 'package:bmicalculator/screens/result_screen.dart';
import 'package:bmicalculator/widgets/app_button.dart';
import 'package:bmicalculator/widgets/gender_container.dart';
import 'package:bmicalculator/widgets/height_slider.dart';
import 'package:bmicalculator/widgets/body_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationBloc, CalculateState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('BMI Calculator'),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    if(state.status==CalculateStatus.loading)
                     const CircularProgressIndicator(),
                     if(state.status==CalculateStatus.error)
                     const Text('An error occurred'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CalculationBloc>()
                                .add(const GenderChange(type: Gender.male));
                          },
                          child:  GenderContainer(
                            icon: Ionicons.male,
                            text: 'Male',
                            isSelect: state.gender==Gender.male,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CalculationBloc>()
                                .add(const GenderChange(type: Gender.female));
                          },
                          child:  GenderContainer(
                            icon: Ionicons.female,
                            text: 'Female',
                            isSelect: state.gender==Gender.female,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    HeightSlider(
                      slideValue: state.sliderValue,
                      text: state.sliderValue.round().toString(),
                      onChanged: (value) {
                        context.read<CalculationBloc>().add(
                              SliderEvent(value: value),
                            );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeightContainer(
                          title: 'Weight',
                          onTap: () {
                            context.read<CalculationBloc>().add(
                                  const WeightChangeEvent(
                                      type: WeightChangeType.decrement),
                                );
                          },
                          onEvent: () {
                            context.read<CalculationBloc>().add(
                                const WeightChangeEvent(
                                    type: WeightChangeType.increment));
                          },
                          measurement: state.weight.round().toString(),
                        ),
                        WeightContainer(
                            title: 'Age',
                            onTap: () {
                              context.read<CalculationBloc>().add(
                                  const AgeChangeEvent(
                                      type: WeightChangeType.decrement));
                            },
                            onEvent: () {
                              context.read<CalculationBloc>().add(
                                  const AgeChangeEvent(
                                      type: WeightChangeType.increment));
                            },
                            measurement: state.age.toString()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () {
                          context.read<CalculationBloc>().add(BmiCalculator(
                              height: state.sliderValue, weight: state.weight));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ResultScreen();
                              },
                            ),
                          );
                        },
                        child: const AppButton()),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
