import 'package:flutter/material.dart';

class VenNonVegIcon extends StatelessWidget {
  final Color color;
  const VenNonVegIcon({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1, color: color)),
      child: Icon(
        Icons.circle_rounded,
        color: color,
        size: 15,
      ),
    );
  }
}
