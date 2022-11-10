import 'package:flutter/material.dart';
import 'skeleton_widget.dart';

class SkeletonSingleChildScrollView extends StatelessWidget with SkeletonWidget {
  final Widget child;

  const SkeletonSingleChildScrollView({super.key, required this.child});

  @override
  Widget buildLoading(BuildContext context) => OverflowBox(child: child);

  @override
  Widget buildNormal(BuildContext context) => SingleChildScrollView(
        child: child,
      );
}
