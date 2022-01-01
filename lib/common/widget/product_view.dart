import 'package:flutter/material.dart';
import 'package:getx_demo/common/constant/colors.dart';
import 'package:getx_demo/common/widget/common_image_asset.dart';
import 'package:getx_demo/model/products_model.dart';

class ProductCard extends StatelessWidget {
  final ProductsModel? productsModel;
  final GestureTapCallback? onTap;

  const ProductCard({Key? key, this.onTap, this.productsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: ColorResources.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: CommonImageAsset(
              isWebImage: true,
              imageName: productsModel?.image,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            productsModel!.title.toString(),
            style: const TextStyle(
              color: ColorResources.grey,
              overflow: TextOverflow.ellipsis,
              fontSize: 14,
            ),
          ),
          Text(
            '\$ ${productsModel?.price}',
            style: const TextStyle(
              color: ColorResources.white,
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
