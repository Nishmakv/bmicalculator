import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class WeightContainer extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final void Function() onEvent;
  final String measurement;
  const WeightContainer({
    super.key,
    required this.title,
    required this.onTap,
    required this.onEvent,
    required this.measurement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xff173142),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              measurement,
              style: const TextStyle(
                fontSize: 40,
                color: Color(0xffe29b3f),
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xff363844),
                    child: Icon(
                      Ionicons.remove,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onEvent,
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xff363844),
                    child: Icon(
                      Ionicons.add,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
