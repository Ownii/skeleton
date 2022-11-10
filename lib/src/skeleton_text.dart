import 'package:flutter/material.dart';
import 'skeleton_style.dart';
import 'wrap_if.dart';

import 'skeleton_widget.dart';

class SkeletonText extends StatelessWidget with SkeletonWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  SkeletonText(this.data,
      {super.key, this.style, this.textAlign, this.overflow, this.maxLines});

  @override
  Widget buildLoading(BuildContext context) => TextSkeleton(
        text: data,
        style: style,
        textAlign: textAlign,
        maxLines: maxLines,
      );

  @override
  Widget buildNormal(BuildContext context) => Text(
        data,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      );
}

class TextSkeleton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  const TextSkeleton(
      {super.key,
      required this.text,
      this.style,
      this.textAlign,
      this.maxLines});

  TextStyle _effectiveStyle(BuildContext context) =>
      DefaultTextStyle.of(context).style.merge(style);

  TextPainter _textPainter(BuildContext context, BoxConstraints constraints) {
    final span = TextSpan(text: text, style: _effectiveStyle(context));

    final scaleFactor = MediaQuery.textScaleFactorOf(context);
    final textHeightBehavior =
        DefaultTextStyle.of(context).textHeightBehavior ??
            DefaultTextHeightBehavior.of(context);

    final painter = TextPainter(
        text: span,
        textDirection: TextDirection.ltr,
        textAlign: textAlign ?? TextAlign.start,
        textScaleFactor: scaleFactor,
        textHeightBehavior: textHeightBehavior,
        strutStyle: StrutStyle.fromTextStyle(_effectiveStyle(context)),
        maxLines: maxLines);
    painter.layout(maxWidth: constraints.maxWidth);
    return painter;
  }

  @override
  Widget build(BuildContext context) => WrapIf(
        condition: maxLines == 1,
        wrapper: (child) => SizedBox(
          height: (_effectiveStyle(context).fontSize ?? 14) *
              (_effectiveStyle(context).height ?? 1.25),
          child: child,
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final painter = _textPainter(context, constraints);
            final size = constraints.constrain(painter.size);
            return SizedBox(
              width: size.width,
              height: size.height,
              child: CustomPaint(
                painter: SkeletonPainter(
                  painter: painter,
                  text: text,
                  align: textAlign,
                  color: SkeletonStyle.of(context).color
                ),
              ),
            );
          },
        ),
      );
}

class SkeletonPainter extends CustomPainter {
  final TextPainter painter;
  final String text;
  final Paint skeletonPaint;
  final paddingTop = 2;
  final paddingBottom = 2;
  final TextAlign? align;

  SkeletonPainter(
      {required this.painter,
      required this.text,
      required Color color,
      this.align})
      : skeletonPaint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final List<TextBox> boxes = painter.getBoxesForSelection(
        TextSelection(baseOffset: 0, extentOffset: text.length));
    for (var box in boxes) {
      _drawLine(box, canvas, size);
    }
  }

  void _drawLine(TextBox box, Canvas canvas, Size size) {
    final rectWithRadius = RRect.fromRectAndRadius(
      _getAlignedRect(box, size.width),
      Radius.circular(box.toRect().height),
    );
    canvas.drawRRect(rectWithRadius, skeletonPaint);
  }

  Rect _getAlignedRect(TextBox box, double width) {
    var left = box.left;
    var right = box.right;
    switch (align) {
      case TextAlign.end:
      case TextAlign.right:
        right = width - box.left;
        left = width - box.right;
        break;
      case TextAlign.center:
        left = (box.left + box.right) / 2;
        right = width - left;
        break;
      case TextAlign.justify:
        left = 0;
        right = 0;
        break;
      default:
        left = box.left;
        right = box.right;
        break;
    }

    return Rect.fromLTRB(
        left, box.top + paddingTop, right, box.bottom - paddingBottom);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
