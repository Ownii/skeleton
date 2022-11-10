import 'package:flutter/material.dart';

class SkeletonLoading extends InheritedWidget {
  final bool isLoading;

  const SkeletonLoading({required this.isLoading, required super.child, super.key});

  @override
  bool updateShouldNotify(SkeletonLoading oldWidget) =>
      oldWidget.isLoading != isLoading;

  static SkeletonLoading? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();
}
