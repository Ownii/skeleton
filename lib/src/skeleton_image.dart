import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'skeleton_widget.dart';

class SkeletonImage extends StatelessWidget with SkeletonWidget {
  final double? width;
  final double? height;
  final Color? color;
  final ImageProvider image;

  const SkeletonImage(
      {super.key, this.width, this.height, this.color, required this.image});

  @override
  Widget buildLoading(BuildContext context) => ImageSkeleton(width: width, height: height);

  @override
  Widget buildNormal(BuildContext context) => Image(
        width: width,
        height: height,
        color: color,
        image: image,
      );
}


class ImageSkeleton extends StatelessWidget {

  final double? width;
  final double? height;

  const ImageSkeleton({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: SkeletonStyle.of(context).color,
      borderRadius: BorderRadius.circular(width ?? 0),
    ),
    width: width,
    height: height,
  );
}
