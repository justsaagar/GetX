import 'dart:io';

import 'package:get/get.dart';
import 'package:getx_demo/common/widget/debug_common_cons.dart';
import 'package:getx_demo/model/products_model.dart';
import 'package:getx_demo/rest_api/products_rest_api/rest_api.dart';

class ProductsController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList products = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProducts();
  }

  fetchProducts() async {
    try {
      List<ProductsModel>? products = await FetchAllProducts.fetchProducts();
      if (products != null) {
        this.products.value = products;
      }
    } on HttpException catch (e) {
      debugPrints('Fetch Products --> ${e.message}');
    } finally {
      isLoading(false);
    }
  }
}
