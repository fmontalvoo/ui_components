import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  const BorderedContainer({
    Key? key,
    this.width = double.infinity,
    this.height,
    this.margin,
    this.padding,
    this.borderColor = Colors.black,
    this.fillColor = Colors.white,
    this.borderRadius,
    this.boxShadow = const <BoxShadow>[
      BoxShadow(
          color: Colors.black54,
          blurRadius: 3.0,
          offset: Offset(0.0, 5.0),
          spreadRadius: 3.0)
    ],
    this.gradient,
    this.child,
    this.strokeWidth = 1.0,
  }) : super(key: key);

  final double width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;
  final Color fillColor;
  final BorderRadiusGeometry? borderRadius;
  final List<BoxShadow> boxShadow;
  final Gradient? gradient;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(
            width: strokeWidth,
            color: borderColor,
          ),
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          gradient: gradient),
      height: height,
      child: child,
    );
  }
}
