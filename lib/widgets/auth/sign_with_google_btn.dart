import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simbiotik_test/theme/colors.dart';

class SignInWithGoogleBtn extends StatelessWidget {
  final VoidCallback onTap;
  const SignInWithGoogleBtn({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: LightColor.bgBlue,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: LightColor.background.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset(
                "assets/google.svg",
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Google",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}