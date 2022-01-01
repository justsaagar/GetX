import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:getx_demo/common/constant/strings.dart';
import 'package:getx_demo/common/widget/debug_common_cons.dart';
import 'package:getx_demo/model/products_model.dart';

class FetchAllProducts {
  static Future<List<ProductsModel>?> fetchProducts() async {
    String url = '${StringResources.baseUrl}products';
    debugPrints('URL --> $url');

    try {
      Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        debugPrints('Response data --> ${response.body}');
        return productsModelFromJson(response.body);
      }
    } on HttpException catch (e) {
      debugPrints('Catch error in fetchProducts --> ${e.message}');
    }
  }
}
