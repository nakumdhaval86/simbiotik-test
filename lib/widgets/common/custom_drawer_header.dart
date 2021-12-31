import 'package:flutter/material.dart';
import 'package:simbiotik_test/theme/colors.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [LightColor.darkGreen, LightColor.lightGreen],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 30,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    "https://randomuser.me/api/portraits/men/47.jpg"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Dhaval Nakum",
              style: TextStyle(color: LightColor.white),
            ),
            const Text(
              "ID : 454",
              style: TextStyle(color: LightColor.white),
            )
          ],
        ),
      ),
    );
  }
}
