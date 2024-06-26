import 'package:flutter/material.dart';

class GenderContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isSelect;
  const GenderContainer({
    super.key,
    required this.icon,
    required this.text,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelect ? Colors.blue : const Color(0xff173142),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
        child: Column(
          children: [
            Icon(
              icon,
              size: 80,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
