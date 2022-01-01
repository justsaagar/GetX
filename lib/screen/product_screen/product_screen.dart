import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/constant/colors.dart';
import 'package:getx_demo/common/constant/images.dart';
import 'package:getx_demo/common/constant/strings.dart';
import 'package:getx_demo/common/widget/common_image_asset.dart';
import 'package:getx_demo/common/widget/loading_screen.dart';
import 'package:getx_demo/common/widget/product_view.dart';
import 'package:getx_demo/controller/products_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  final ProductsController productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    printInfo();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            StringResources.appTitle,
            style: TextStyle(
              color: ColorResources.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
        body: Stack(
          children: [
            const CommonImageAsset(
              imageName: ImageResources.backgroundImage,
              fit: BoxFit.fill,
            ),
            SafeArea(
              child: Obx(
                () {
                  return (!productsController.isLoading.value &&
                          productsController.products.isEmpty)
                      ? const LoadingScreen()
                      : GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 20,
                          ),
                          itemCount: productsController.products.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.70,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                          ),
                          itemBuilder: (context, index) => ProductCard(
                            productsModel: productsController.products[index],
                          ),
                        );
                },
              ),
            ),
            Obx(() {
              return productsController.isLoading.value
                  ? const LoadingScreen()
                  : Container();
            }),
          ],
        ),
      ),
    );
  }
}
