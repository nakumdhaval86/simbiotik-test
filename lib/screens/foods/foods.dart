import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simbiotik_test/controller/auth/auth_with_social.dart';
import 'package:simbiotik_test/controller/cartcontroller.dart';
import 'package:simbiotik_test/controller/foodlistcontroller.dart';
import 'package:simbiotik_test/screens/cart/cart.dart';
import 'package:simbiotik_test/theme/colors.dart';
import 'package:simbiotik_test/widgets/common/custom_drawer_header.dart';
import 'package:simbiotik_test/widgets/common/inc_dec_btn.dart';
import 'package:simbiotik_test/widgets/common/veg_non_veg_icon.dart';

class FoodsListScreen extends StatefulWidget {
  const FoodsListScreen({Key? key}) : super(key: key);

  @override
  State<FoodsListScreen> createState() => _FoodsListScreenState();
}

class _FoodsListScreenState extends State<FoodsListScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  FoodListController foodListController = Get.put(FoodListController());
  CartController cartController = Get.put(CartController());

  navigateToCart() {
    Get.to(() => CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => foodListController.loading.isTrue
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: LightColor.darkGreen,
                ),
              ),
            )
          : DefaultTabController(
              length: foodListController.foodData.length,
              child: Scaffold(
                key: _drawerKey,
                drawer: Drawer(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const CustomDrawerHeader(),
                      ListTile(
                        onTap: () => SocialAuth.signOut(),
                        title: const Text("Logout"),
                        leading: const Icon(Icons.logout),
                      )
                    ],
                  ),
                ),
                appBar: AppBar(
                  leading: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: LightColor.grey,
                    ),
                    onPressed: () => _drawerKey.currentState?.openDrawer(),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Stack(
                        children: [
                          IconButton(
                            onPressed: navigateToCart,
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: LightColor.grey,
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 5,
                            child: CircleAvatar(
                              radius: 10,
                              child: Text(
                                cartController.cartData.length.toString(),
                                style: const TextStyle(
                                  color: LightColor.white,
                                  fontSize: 10,
                                ),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: Colors.red,
                    unselectedLabelColor: LightColor.grey,
                    indicatorColor: Colors.red,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    tabs: foodListController.foodData
                        .map((element) => Tab(
                              text: element['menu_category'],
                            ))
                        .toList(),
                  ),
                ),
                body: TabBarView(
                  children: foodListController.foodData
                      .map(
                        (element) => Center(
                            child: ListView.builder(
                          itemCount: element['category_dishes'].length,
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
                                    color:
                                        LightColor.background.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          child: Text(
                                            element['category_dishes'][index]
                                                ['dish_name'],
                                            style: const TextStyle(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'INR  ${element['category_dishes'][index]['dish_price']}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: LightColor.grey,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              '${element['category_dishes'][index]['dish_calories']} calories',
                                              style: const TextStyle(
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
                                        Text(
                                          element['category_dishes'][index]
                                              ['dish_description'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: LightColor.lightGrey,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.5,
                                          child: IncDecBtn(
                                            increment: () {
                                              cartController
                                                  .addToCartController(
                                                element['category_dishes']
                                                    [index],
                                              );
                                            },
                                            decrement: () {
                                              cartController.removeFromCart(
                                                  element['category_dishes']
                                                      [index]['dish_id']);
                                            },
                                            number:
                                                cartController.countQtyFromCart(
                                                    element['category_dishes']
                                                        [index]['dish_id']),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        element['category_dishes'][index]
                                                        ['addonCat']
                                                    .length >
                                                0
                                            ? const Text(
                                                "Customizations Available",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.network(
                                      "https://via.placeholder.com/150",
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                      )
                      .toList(),
                ),
              ),
            ),
    );
  }
}
