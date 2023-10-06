import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'skeleton_widget.dart';

class SkeletonIcon extends StatelessWidget with SkeletonWidget {
  final IconData icon;
  final Color? color;
  final double? size;

  const SkeletonIcon(this.icon, {super.key, this.color, this.size});

  @override
  Widget buildLoading(BuildContext context) => Icon(
        icon,
        color: SkeletonStyle.of(context).color,
        size: size,
      );

  @override
  Widget buildNormal(BuildContext context) => Icon(
        icon,
        color: color,
        size: size,
      );
}
