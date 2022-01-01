import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:getx_demo/common/constant/strings.dart';
import 'package:getx_demo/common/widget/debug_common_cons.dart';
import 'package:getx_demo/model/products_model.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

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
    } on GetHttpException catch (e) {
      debugPrints('Catch http error in fetchProducts --> ${e.message}');
    } on GraphQLError catch (e) {
      debugPrints('Catch Graph QL error in fetchProducts --> ${e.message}');
    } on UnauthorizedException catch (e) {
      debugPrints('Unauthorized action in fetchProducts --> $e');
    } on UnexpectedFormat catch (e) {
      debugPrints('Unexpected Format in fetchProducts --> ${e.message}');
    }
  }
}
