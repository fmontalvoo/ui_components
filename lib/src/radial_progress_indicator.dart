import 'dart:math' as math;

import 'package:flutter/material.dart';

class RadialProgressIndicator extends StatefulWidget {
  const RadialProgressIndicator({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.percentage,
    this.inStrokeWitdh = 5,
    this.outStrokeWitdh = 10,
    this.inStrokeColor = Colors.grey,
    this.outStrokeColor = Colors.green,
    this.showPercentage = true,
    this.gradient,
    this.style = const TextStyle(fontSize: 25),
  }) : super(key: key);

  final double width;
  final double height;
  final double percentage;
  final double inStrokeWitdh;
  final double outStrokeWitdh;
  final Color inStrokeColor;
  final Color outStrokeColor;
  final bool showPercentage;
  final Gradient? gradient;
  final TextStyle style;

  @override
  _RadialProgressIndicatorState createState() =>
      _RadialProgressIndicatorState();
}

class _RadialProgressIndicatorState extends State<RadialProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  late double percentageAux;

  @override
  void initState() {
    percentageAux = widget.percentage;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller!.forward(from: 0);

    final diferencia = widget.percentage - percentageAux;
    percentageAux = widget.percentage;

    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(7),
          width: widget.width,
          height: widget.height,
          child: CustomPaint(
            child: Center(
                child: widget.showPercentage
                    ? Text(
                        "${widget.percentage}%",
                        style: widget.style,
                        textAlign: TextAlign.center,
                      )
                    : Container()),
            painter: _RadialProgress(
              percentage: (widget.percentage - diferencia) +
                  (diferencia * _controller!.value),
              inStrokeColor: widget.inStrokeColor,
              outStrokeColor: widget.outStrokeColor,
              inStrokeWitdh: widget.inStrokeWitdh,
              outStrokeWitdh: widget.outStrokeWitdh,
              gradient: widget.gradient,
            ),
          ),
        );
      },
    );
  }
}

class _RadialProgress extends CustomPainter {
  _RadialProgress({
    this.percentage = 0,
    this.inStrokeWitdh,
    this.outStrokeWitdh,
    this.inStrokeColor,
    this.outStrokeColor,
    this.gradient,
  });

  final double percentage;
  final double? inStrokeWitdh;
  final double? outStrokeWitdh;
  final Color? inStrokeColor;
  final Color? outStrokeColor;
  final Gradient? gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // Circulo
    final paintCricle = Paint()
      ..strokeWidth = inStrokeWitdh!
      ..color = inStrokeColor!
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCricle);

    // Arco
    final rect = Rect.fromCircle(
      center: const Offset(0, 0),
      radius: 180,
    );

    final paintArc = Paint()
      ..strokeWidth = outStrokeWitdh!
      ..strokeCap = StrokeCap.round
      ..color = outStrokeColor!
      ..style = PaintingStyle.stroke;

    if (gradient != null) {
      paintArc.shader = gradient!.createShader(rect);
    }

    double arcAngle = 2 * math.pi * (percentage / 100);
    canvas.drawArc(
        Rect.fromCircle(
          center: center,
          radius: radius,
        ),
        (-math.pi / 2),
        arcAngle,
        false,
        paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
