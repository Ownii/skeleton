import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'skeleton_widget.dart';

class SkeletonContainer extends StatelessWidget with SkeletonWidget {
  final double? width;
  final double? height;
  final BoxDecoration? decoration;
  final Color? color;

  const SkeletonContainer(
      {super.key, this.width, this.height, this.decoration, this.color});

  @override
  Widget buildLoading(BuildContext context) => ContainerSkeleton(
        height: height,
        width: width,
        decoration: decoration,
      );

  @override
  Widget buildNormal(BuildContext context) => Container(
        color: color,
        width: width,
        height: height,
        decoration: decoration,
      );
}

class ContainerSkeleton extends StatelessWidget {
  final double? width;
  final double? height;
  final BoxDecoration? decoration;

  const ContainerSkeleton(
      {super.key, this.width, this.height, this.decoration});

  @override
  Widget build(BuildContext context) => Container(
        color: decoration != null ? null : SkeletonStyle.of(context).color,
        width: width,
        height: height,
        decoration:
            decoration?.copyWith(color: SkeletonStyle.of(context).color),
      );
}
