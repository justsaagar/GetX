import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_demo/common/constant/images.dart';

class CommonImageAsset extends StatelessWidget {
  final String? imageName;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Color? color;
  final bool isWebImage;

  const CommonImageAsset(
      {Key? key,
      this.imageName,
      this.fit,
      this.height,
      this.width,
      this.color,
      this.isWebImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isWebImage
        ? CachedNetworkImage(
            imageUrl: imageName!,
            placeholder: (context, url) =>
                const CommonImageAsset(imageName: ImageResources.getXImage),
            errorWidget: (context, url, error) =>
                const CommonImageAsset(imageName: ImageResources.getXImage),
          )
        : imageName!.split('.').last != 'svg'
            ? Image.asset(
                imageName!,
                fit: fit,
                height: height,
                width: width,
                color: color,
              )
            : SvgPicture.asset(
                imageName!,
                height: height,
                width: width,
                color: color,
              );
  }
}
