import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simbiotik_test/theme/colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: LightColor.grey),
        title: const Text(
          "Order Summary",
          style: TextStyle(color: LightColor.grey),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: LightColor.darkGreen,
              alignment: Alignment.center,
              height: 40,
              child: const Text(
                "2 Dishes - 2 items",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: LightColor.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
