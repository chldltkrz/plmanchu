import 'package:flutter/material.dart';
import 'dart:math';

class PentagonRadarChart extends StatefulWidget {
  final List<double> values; // Values for each axis
  final List<String> labels; // Labels for each axis
  final double maxValue; // Maximum value for the radar chart

  const PentagonRadarChart({
    Key? key,
    required this.values,
    required this.labels,
    this.maxValue = 100.0,
  }) : super(key: key);

  @override
  _PentagonRadarChartState createState() => _PentagonRadarChartState();
}

class _PentagonRadarChartState extends State<PentagonRadarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CustomPaint(
          size: Size(300, 300),
          painter: _RadarChartPainter(
            values: widget.values,
            labels: widget.labels,
            maxValue: widget.maxValue,
            animationValue: _animation.value,
          ),
        );
      },
    );
  }
}

class _RadarChartPainter extends CustomPainter {
  final List<double> values;
  final List<String> labels;
  final double maxValue;
  final double animationValue;

  _RadarChartPainter({
    required this.values,
    required this.labels,
    required this.maxValue,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) * 0.8;
    final angleStep = (2 * pi) / values.length;

    final paintRadar = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final paintLines = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final path = Path();

    // Draw the radar shape
    for (int i = 0; i < values.length; i++) {
      double scaledValue = (values[i] / maxValue) * radius * animationValue;
      final angle = i * angleStep - pi / 2; // Start at top

      final point = Offset(
        center.dx + scaledValue * cos(angle),
        center.dy + scaledValue * sin(angle),
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }

      // Draw axis lines
      canvas.drawLine(center, point, paintLines);
    }

    path.close();
    canvas.drawPath(path, paintRadar);

    // Draw labels
    for (int i = 0; i < labels.length; i++) {
      final angle = i * angleStep - pi / 2;
      final labelPoint = Offset(
        center.dx + (radius + 20) * cos(angle),
        center.dy + (radius + 20) * sin(angle),
      );

      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        textDirection: TextDirection.ltr,
      )..layout(minWidth: 0, maxWidth: 60);

      textPainter.paint(
          canvas,
          Offset(
            labelPoint.dx - textPainter.width / 2,
            labelPoint.dy - textPainter.height / 2,
          ));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
