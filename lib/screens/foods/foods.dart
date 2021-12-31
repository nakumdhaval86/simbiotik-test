import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:simbiotik_test/controller/auth/auth_with_social.dart';
import 'package:simbiotik_test/screens/cart/cart.dart';
import 'package:simbiotik_test/theme/colors.dart';
import 'package:simbiotik_test/widgets/common/custom_drawer_header.dart';
import 'package:simbiotik_test/widgets/common/veg_non_veg_icon.dart';

class FoodsListScreen extends StatefulWidget {
  const FoodsListScreen({Key? key}) : super(key: key);

  @override
  State<FoodsListScreen> createState() => _FoodsListScreenState();
}

class _FoodsListScreenState extends State<FoodsListScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  navigateToCart() {
    Get.to(() => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: IconButton(
              onPressed: navigateToCart,
              icon: const Icon(
                Icons.shopping_cart,
                color: LightColor.grey,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
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
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: LightColor.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "6",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: LightColor.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.remove,
                                    color: LightColor.white,
                                  ),
                                ),
                              ],
                            ),
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
        ),
      ),
    );
  }
}
