import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simbiotik_test/controller/cartcontroller.dart';
import 'package:simbiotik_test/theme/colors.dart';
import 'package:simbiotik_test/widgets/common/inc_dec_btn.dart';
import 'package:simbiotik_test/widgets/common/veg_non_veg_icon.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final CartController cartController = Get.put(CartController());

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
      floatingActionButton: Obx(
        () => cartController.cartData.isNotEmpty
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 50,
                    decoration: BoxDecoration(
                      color: LightColor.grey,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Total Amount : ${cartController.countTotalAmount(cartController.cartData)}',
                      style: const TextStyle(
                        color: LightColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: 50,
                      decoration: BoxDecoration(
                        color: LightColor.darkGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "Place Order",
                        style: TextStyle(
                          color: LightColor.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SafeArea(
        child: Column(
          children: [
            Container(
                color: LightColor.darkGreen,
                alignment: Alignment.center,
                height: 40,
                child: Obx(
                  () => Text(
                    '${cartController.itemData.length} Dishes  - ${cartController.cartData.length} Items',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: LightColor.white,
                    ),
                  ),
                )),
            Expanded(
                child: Obx(
              () => cartController.itemData.isEmpty
                  ? const Center(
                      child: Text(
                        "No Item in cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: LightColor.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: cartController.itemData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
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
                            children: [
                              Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const VenNonVegIcon(color: Colors.green),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartController.itemData[index]
                                                ['dish_name'],
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: LightColor.grey,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'INR ${cartController.itemData[index]['dish_price']}',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: LightColor.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${cartController.itemData[index]['dish_calories']} Calories',
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: LightColor.grey,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(
                                () => IncDecBtn(
                                  increment: () {
                                    cartController.addToCartController(
                                      cartController.itemData[index],
                                    );
                                  },
                                  decrement: () {
                                    cartController.removeFromCart(cartController
                                        .itemData[index]['dish_id']);
                                  },
                                  number: cartController.countQtyFromCart(
                                      cartController.itemData[index]
                                          ['dish_id']),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'INR ${cartController.countTotalPrice(cartController.itemData[index]['dish_id'])}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
            ))
          ],
        ),
      ),
    );
  }
}
