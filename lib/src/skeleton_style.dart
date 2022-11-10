import 'package:flutter/material.dart';

class SkeletonStyle extends ThemeExtension<SkeletonStyle> {

  final Color color;

  SkeletonStyle({required this.color});

  @override
  ThemeExtension<SkeletonStyle> copyWith({Color? color}) => SkeletonStyle(color: color ?? this.color);

  @override
  ThemeExtension<SkeletonStyle> lerp(ThemeExtension<SkeletonStyle>? other, double t) {
    if (other is! SkeletonStyle) {
      return this;
    }

    return SkeletonStyle(color: Color.lerp(color, other.color, t) ?? color);
  }

  static final SkeletonStyle _defaultStyle =  SkeletonStyle(color: Colors.grey[400]!);

  static SkeletonStyle of(BuildContext context) {
    final customThemeStyle = Theme.of(context).extension<SkeletonStyle>();
    if( customThemeStyle != null ) return customThemeStyle;

    return _defaultStyle;
  }

}