import 'package:flutter/cupertino.dart';

class ButtonBackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 3.0;
    paint.shader = const LinearGradient(
            begin: Alignment.topRight, end: Alignment.bottomLeft,
            // ignore:
            colors: [Color(0xff262C51), Color(0xff3E3F74)])
        .createShader(const Rect.fromLTWH(0, 0, 0, 0));
    final segmentWidth = size.width / 24;
    final segmentHeight = size.height / 9;

    Path path = Path();
    path.moveTo(0, segmentHeight * 9);
    path.cubicTo(
      segmentWidth * 6,
      segmentHeight * 9,
      segmentWidth * 4,
      0,
      10 * segmentWidth,
      0,
    );
    path.lineTo(segmentWidth * 14, 0);
    path.cubicTo(segmentWidth * 20, 0, segmentWidth * 18, segmentHeight * 8,
        segmentWidth * 24, segmentHeight * 9);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
