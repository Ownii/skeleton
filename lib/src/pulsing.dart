import 'package:flutter/material.dart';

class Pulsing extends StatefulWidget {
  final Widget child;
  final bool active;
  final bool sliver;

  const Pulsing(
      {super.key, required this.child, this.active = true, this.sliver = false});

  @override
  State<Pulsing> createState() => _PulsingState();
}

class _PulsingState extends State<Pulsing> with TickerProviderStateMixin {
  late AnimationController pulseController;

  @override
  void initState() {
    super.initState();
    pulseController = AnimationController(
      duration: const Duration(seconds: 1, milliseconds: 500),
      vsync: this,
      lowerBound: 0.4,
    );

    pulseController
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          pulseController.reverse();
        }
        if (status == AnimationStatus.dismissed) {
          pulseController.forward();
        }
      });

    if (widget.active) {
      pulseController.forward();
    }
  }

  @override
  void dispose() {
    pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sliver) {
      return SliverOpacity(
        opacity: pulseController.value,
        sliver: widget.child,
      );
    }
    return Opacity(
      opacity: pulseController.value,
      child: widget.child,
    );
  }
}
