import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import 'package:simbiotik_test/constants/apiurl.dart';
import 'package:simbiotik_test/services/network.dart';

class FoodListController extends GetxController {
  APIClient apiClient = APIClient();
  RxBool loading = false.obs;
  RxList foodData = [].obs;

  getFoods() async {
    loading.value = true;
    try {
      dio.Response response = await apiClient.getData(
        url: apiUrl,
      );
      if (response.statusCode == 200) {
        foodData.value = response.data[0]['table_menu_list'];
      } else {
        Get.snackbar(
          'Error',
          response.statusCode.toString() +
              ":" +
              response.statusMessage.toString(),
        );
      }
    } catch (e) {
      Get.snackbar('Error', 'Cannot get data,Please try again');
    } finally {
      loading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getFoods();
  }
}
