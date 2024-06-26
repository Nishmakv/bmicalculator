import 'package:bmicalculator/bloc/calculation_bloc.dart';
import 'package:bmicalculator/enum/bmi_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return BmiType.underWeight;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return BmiType.normalWeight;
    } else if (bmi >= 25 && bmi < 29.9) {
      return BmiType.overWeight;
    } else {
      return BmiType.obesity;
    }
  }

  categoryName(bmiType) {
    switch (bmiType) {
      case BmiType.underWeight:
        return 'UnderWeight';
      case BmiType.normalWeight:
        return 'NormalWeight';
      case BmiType.overWeight:
        return 'OverWeight';
      case BmiType.obesity:
        return 'Obesity';
      default:
        return 'Unknown';
    }
  }

  categoryDescription(bmiType) {
    switch (bmiType) {
      case BmiType.underWeight:
        return 'Your weight is poor, please eat more';
      case BmiType.normalWeight:
        return 'Good job! Your weight is normal';
      case BmiType.overWeight:
        return 'Please keep diet and do proper exercise. Your weight is over.';
      case BmiType.obesity:
        return 'Obesity';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<CalculationBloc, CalculateState>(
      builder: (context, state) {
        BmiType bmiType = getBmiCategory(state.result!);
        String category = categoryName(bmiType);
        String description = categoryDescription(bmiType);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Your Result'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff173142),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      if (state.status == CalculateStatus.loading)
                        const CircularProgressIndicator(),
                      if (state.status == CalculateStatus.error)
                        const Text('An error occurred'),
                      Text(
                        category,
                        style: const TextStyle(
                          color: Color(0xff66f1b0),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.3,
                        child: Center(
                          child: Text(
                            state.result!.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 70,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Color(0xff66f1b0),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
