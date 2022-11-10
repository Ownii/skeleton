import 'package:flutter/material.dart';

class WrapIf extends StatelessWidget {
  final Widget child;
  final bool condition;
  final Widget Function(Widget) wrapper;

  const WrapIf(
      {super.key,
        required this.condition,
        required this.wrapper,
        required this.child});

  @override
  Widget build(BuildContext context) {
    return condition ? wrapper(child) : child;
  }
}
