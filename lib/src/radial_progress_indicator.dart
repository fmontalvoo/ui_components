import 'dart:math' as Math;

import 'package:flutter/material.dart';

class RadialProgressIndicator extends StatefulWidget {
  final double width;
  final double height;
  final double percentage;
  final double inStrokeWitdh;
  final double outStrokeWitdh;
  final Color inStrokeColor;
  final Color outStrokeColor;
  final bool showPercentage;
  final Gradient gradient;
  final TextStyle style;

  RadialProgressIndicator(
      {Key key,
      this.width = double.infinity,
      this.height = double.infinity,
      @required this.percentage,
      this.inStrokeWitdh = 5.0,
      this.outStrokeWitdh = 10.0,
      this.inStrokeColor = Colors.grey,
      this.outStrokeColor = Colors.green,
      this.showPercentage = true,
      this.gradient,
      this.style = const TextStyle(fontSize: 25)})
      : super(key: key);
  @override
  _RadialProgressIndicatorState createState() =>
      _RadialProgressIndicatorState();
}

class _RadialProgressIndicatorState extends State<RadialProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double percentageAux;

  @override
  void initState() {
    percentageAux = widget.percentage;

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward(from: 0.0);

    final diferencia = widget.percentage - percentageAux;
    percentageAux = widget.percentage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(7.0),
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
                    (diferencia * _controller.value),
                inStrokeColor: widget.inStrokeColor,
                outStrokeColor: widget.outStrokeColor,
                inStrokeWitdh: widget.inStrokeWitdh,
                outStrokeWitdh: widget.outStrokeWitdh,
                gradient: widget.gradient),
          ),
        );
      },
    );
  }
}

class _RadialProgress extends CustomPainter {
  final double percentage;
  final double inStrokeWitdh;
  final double outStrokeWitdh;
  final Color inStrokeColor;
  final Color outStrokeColor;
  final Gradient gradient;

  _RadialProgress({
    this.percentage = 0.0,
    this.inStrokeWitdh,
    this.outStrokeWitdh,
    this.inStrokeColor,
    this.outStrokeColor,
    this.gradient,
  });
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo
    final paintCricle = Paint()
      ..strokeWidth = this.inStrokeWitdh
      ..color = this.inStrokeColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2.0, size.height / 2.0);
    final radius = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCricle);

    // Arco
    final rect = Rect.fromCircle(center: Offset(0.0, 0.0), radius: 180.0);

    final paintArc = Paint()
      ..strokeWidth = this.outStrokeWitdh
      ..strokeCap = StrokeCap.round
      ..color = this.outStrokeColor
      ..style = PaintingStyle.stroke;

    if (gradient != null) paintArc.shader = gradient.createShader(rect);

    double arcAngle = 2 * Math.pi * (percentage / 100.0);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        (-Math.pi / 2.0), arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}