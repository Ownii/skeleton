import 'package:flutter/material.dart';
import 'skeleton_loading.dart';
import 'pulsing.dart';

typedef SkeletonWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef SkeletonErrorBuilder = Widget Function(BuildContext context, dynamic error);

class SkeletonFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final SkeletonWidgetBuilder<T> builder;
  final SkeletonErrorBuilder error;
  final T dummy;

  const SkeletonFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    required this.error,
    required this.dummy,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError || (snapshot.connectionState == ConnectionState.done && snapshot.data == null)) {
          return error(context, snapshot.error);
        }

        final isLoading = snapshot.data == null;

        return isLoading
            ? SkeletonLoading(
                isLoading: true,
                child: Pulsing(
                  active: isLoading,
                  child: IgnorePointer(child: builder(context, dummy)),
                ),
              )
            : builder(context, snapshot.data ?? dummy);
      });
}
