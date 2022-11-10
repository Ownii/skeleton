import 'package:flutter/material.dart';
import 'skeleton_loading.dart';

mixin SkeletonWidget on StatelessWidget {
  @override
  Widget build(BuildContext context) => SkeletonLoading.of(context)?.isLoading ?? false
      ? buildLoading(context)
      : buildNormal(context);

  Widget buildLoading(BuildContext context);

  Widget buildNormal(BuildContext context);
}
