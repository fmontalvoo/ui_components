import 'package:flutter/material.dart';

class DescriptionText extends StatefulWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  final int maxLength;
  final String seeMore;
  final String seeLess;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;

  DescriptionText({
    @required this.text,
    this.textAlign = TextAlign.start,
    this.style,
    this.maxLength: 250,
    this.seeMore: "See more",
    this.seeLess: "See less",
    this.buttonColor: Colors.blue,
    this.padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
  });

  @override
  _DescriptionTextState createState() => _DescriptionTextState(
        text: text,
        style: style,
        maxLength: maxLength,
        seeMore: seeMore,
        seeLess: seeLess,
        buttonColor: buttonColor,
        padding: padding,
      );
}

class _DescriptionTextState extends State<DescriptionText> {
  final String text;
  final TextStyle style;
  final int maxLength;
  final String seeMore;
  final String seeLess;
  final Color buttonColor;
  final EdgeInsetsGeometry padding;

  String firstHalf;
  String secondHalf;
  bool flag = true;

  _DescriptionTextState({
    this.text,
    this.style,
    this.maxLength,
    this.seeMore,
    this.seeLess,
    this.buttonColor,
    this.padding,
  });

  @override
  void initState() {
    super.initState();
    int textLength = text.length;
    if (textLength > maxLength) {
      firstHalf = text.substring(0, maxLength);
      secondHalf = text.substring(maxLength, textLength);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: secondHalf.isEmpty
          ? Text(firstHalf, textAlign: widget.textAlign, style: style)
          : Column(
              children: <Widget>[
                Text(
                    flag
                        ? (firstHalf.trim() + "...")
                        : (firstHalf + secondHalf),
                    textAlign: widget.textAlign,
                    style: style),
                InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        flag ? seeMore : seeLess,
                        style: TextStyle(color: buttonColor),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
