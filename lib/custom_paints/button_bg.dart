import 'package:flutter/cupertino.dart';
import 'package:simple_weather_project/const_values/colors.dart';

class ButtonBackgroundPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final segmentWidth = size.width / 24;
    final segmentHeight = size.height / 9;
    Paint paintFill = Paint();

    paintFill.style = PaintingStyle.fill;
    paintFill.strokeWidth = 1.0;

    paintFill.shader = const LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            // ignore:
            colors: [Color(0xff262C51), Color(0xff3E3F74)])
        .createShader(Rect.fromLTWH(segmentWidth * 12, segmentHeight * 5,
            segmentWidth * 24, segmentHeight * 5));

    Paint paintStroke = Paint();
    paintStroke.style = PaintingStyle.stroke;
    paintStroke.strokeWidth = 1.0;

    paintStroke.color = whiteColor.withOpacity(0.3);
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
    canvas.drawPath(path, paintFill);
    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
