import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/model/products_model.dart';
import 'package:getx_demo/rest_api/products_rest_api/rest_api.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  ProductScreenState createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    printInfo();
    return const Scaffold(
      body: Text('data'),
    );
  }
}
