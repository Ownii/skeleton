import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'skeleton_widget.dart';

class SkeletonCircleAvatar extends StatelessWidget with SkeletonWidget {
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  final Widget? child;
  final double radius;

  const SkeletonCircleAvatar(
      {super.key,
      this.backgroundColor,
      this.backgroundImage,
      required this.radius,
      this.child});

  @override
  Widget buildLoading(BuildContext context) => CircleAvatarSkeleton(radius: radius);

  @override
  Widget buildNormal(BuildContext context) => CircleAvatar(
        backgroundColor: backgroundColor,
        backgroundImage: backgroundImage,
        radius: radius,
        child: child,
      );
}


class CircleAvatarSkeleton extends StatelessWidget {

  final double radius;

  const CircleAvatarSkeleton({super.key, required this.radius});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: SkeletonStyle.of(context).color,
      borderRadius: BorderRadius.circular(radius),
    ),
    width: radius * 2,
    height: radius * 2,
  );
}
