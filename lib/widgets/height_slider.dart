import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final double slideValue;
  final String text;
  final ValueChanged<double> onChanged;
  const HeightSlider({
    super.key,
    required this.slideValue,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff173142),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              'Height',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff66f1b0),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          Slider(
            value: slideValue,
            onChanged: onChanged,
            thumbColor: Colors.red,
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            min: 0,
            max: 300,
            divisions: 200,
            label: slideValue.round().toString(),
          ),
        ],
      ),
    );
  }
}
