import 'package:flutter/material.dart';

class BorderedContainer extends StatelessWidget {
  final double height;
  final Widget child;

  const BorderedContainer({Key key, this.height, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 3.0,
                offset: Offset(0.0, 5.0),
                spreadRadius: 3.0)
          ]),
      height: height,
      child: child,
    );
  }
}
