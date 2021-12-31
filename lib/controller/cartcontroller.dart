import 'package:get/get.dart';

class CartController extends GetxController {
  RxList cartData = [].obs;
  RxList itemData = [].obs;

  addToCartController(data) {
    cartData.add(data);

    var len = cartData.where((e) => e['dish_id'] == data['dish_id']);
    if (len.length < 2) {
      itemData.add(data);
    }

    Get.snackbar('Succes', "Item added to cart");
  }

  removeFromCart(dishId) {
    var len = cartData.where((e) => e['dish_id'] == dishId);
    var index = cartData.indexWhere((element) => element['dish_id'] == dishId);
    cartData.removeAt(index);

    if (len.isEmpty) {
      itemData.removeWhere((e) => e['dish_id'] == dishId);
    }

    Get.snackbar('Succes', "Item remove from cart");
  }

  countQtyFromCart(dishId) {
    return cartData
        .where((ele) => ele['dish_id'] == dishId)
        .toList()
        .length
        .toString();
  }

  countTotalPrice(dishId) {
    var index = itemData.indexWhere((element) => element['dish_id'] == dishId);
    var qty = cartData.where((p0) => p0['dish_id'] == dishId).toList().length;
    return itemData[index]['dish_price'] * qty;
  }

  countTotalAmount(value) {
    var amount = 0.0;
    for (var i = 0; i < cartData.length; i++) {
      amount = amount + cartData[i]['dish_price'];
    }
    return amount;
  }
}
