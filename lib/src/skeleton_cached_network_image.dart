import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'skeleton_widget.dart';

class SkeletonCachedNetworkImage extends StatelessWidget with SkeletonWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final PlaceholderWidgetBuilder? placeholder;
  final LoadingErrorWidgetBuilder? errorWidget;

  const SkeletonCachedNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.placeholder,
      this.errorWidget});

  @override
  Widget buildLoading(BuildContext context) => Container(
        width: width,
        height: height,
        color: SkeletonStyle.of(context).color,
      );

  @override
  Widget buildNormal(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: width,
          height: height,
          color: SkeletonStyle.of(context).color,
        ),
        errorWidget: errorWidget,
      );
}
