import 'package:flutter/material.dart';

class BorderedText extends StatelessWidget {
  const BorderedText(
      {Key? key,
      required this.text,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.overflow,
      this.strokeWidth = 2,
      this.maxLines = 1,
      this.borderColor = Colors.black,
      this.fillColor = Colors.white})
      : super(key: key);

  final String text;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double strokeWidth;
  final int maxLines;
  final Color borderColor;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          text,
          textAlign: textAlign,
          maxLines: maxLines,
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
          textAlign: textAlign,
          maxLines: maxLines,
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
