import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'skeleton_widget.dart';

class SkeletonIcon extends StatelessWidget with SkeletonWidget {
  final IconData icon;
  final Color? color;

  const SkeletonIcon(this.icon, {super.key, this.color});

  @override
  Widget buildLoading(BuildContext context) => Icon(
        icon,
        color: SkeletonStyle.of(context).color,
      );

  @override
  Widget buildNormal(BuildContext context) => Icon(
        icon,
        color: color,
      );
}
