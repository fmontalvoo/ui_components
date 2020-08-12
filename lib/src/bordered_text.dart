import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  final String text;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final double strokeWidth;
  final Color borderColor;
  final Color fillColor;

  const BorderedText(
      {Key key,
      @required this.text,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.overflow,
      this.strokeWidth = 5,
      this.borderColor = Colors.black,
      this.fillColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          overflow: overflow,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = strokeWidth
              ..color = borderColor,
          ),
        ),
        Text(
          text,
          overflow: overflow,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fillColor,
          ),
        ),
      ],
    );
  }
}