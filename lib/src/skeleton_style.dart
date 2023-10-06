import 'package:flutter/material.dart';

class SkeletonTheme extends ThemeExtension<SkeletonTheme> {
  final Color color;

  SkeletonTheme({required this.color});

  @override
  ThemeExtension<SkeletonTheme> copyWith({Color? color}) =>
      SkeletonTheme(color: color ?? this.color);

  @override
  ThemeExtension<SkeletonTheme> lerp(
      ThemeExtension<SkeletonTheme>? other, double t) {
    if (other is! SkeletonTheme) {
      return this;
    }

    return SkeletonTheme(color: Color.lerp(color, other.color, t) ?? color);
  }

  static final SkeletonTheme defaultStyle =
      SkeletonTheme(color: Colors.grey[400]!);
}

class SkeletonStyle extends InheritedWidget {
  final Color color;

  const SkeletonStyle({super.key, required this.color, required super.child});

  static SkeletonStyle? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SkeletonStyle>();
  }

  static SkeletonTheme of(BuildContext context) {
    final style = maybeOf(context);
    if (style != null) return SkeletonTheme(color: style.color);
    final customThemeStyle = Theme.of(context).extension<SkeletonTheme>();
    if (customThemeStyle != null) return customThemeStyle;

    return SkeletonTheme.defaultStyle;
  }

  @override
  bool updateShouldNotify(covariant SkeletonStyle oldWidget) =>
      color != oldWidget.color;
}
