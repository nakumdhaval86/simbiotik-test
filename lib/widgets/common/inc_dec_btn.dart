import 'package:flutter/material.dart';
import 'package:simbiotik_test/theme/colors.dart';

class IncDecBtn extends StatelessWidget {
  final VoidCallback increment;
  final VoidCallback decrement;
  final String number;
  const IncDecBtn({
    required this.increment,
    required this.decrement,
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: increment,
            icon: const Icon(
              Icons.add,
              color: LightColor.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            number,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: LightColor.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          IconButton(
            onPressed: decrement,
            icon: const Icon(
              Icons.remove,
              color: LightColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
