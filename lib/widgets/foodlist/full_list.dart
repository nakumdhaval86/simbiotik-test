import 'package:flutter/material.dart';
import 'package:simbiotik_test/theme/colors.dart';
import 'package:simbiotik_test/widgets/common/inc_dec_btn.dart';
import 'package:simbiotik_test/widgets/common/veg_non_veg_icon.dart';

class FoodListFull extends StatelessWidget {
  const FoodListFull({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            color: LightColor.white,
            borderRadius: BorderRadius.circular(10),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
                child: VenNonVegIcon(
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: const Text(
                        "Traditional New England seafood asd",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: LightColor.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "INR 12.00",
                          style: TextStyle(
                            fontSize: 14,
                            color: LightColor.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "30 calories",
                          style: TextStyle(
                            fontSize: 14,
                            color: LightColor.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "with clams, scallops and shrink",
                      style: TextStyle(
                        fontSize: 14,
                        color: LightColor.lightGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: IncDecBtn(
                        increment: () {},
                        decrement: () {},
                        number: "20",
                      ),
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Plateau_van_zeevruchten.jpg/450px-Plateau_van_zeevruchten.jpg',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
