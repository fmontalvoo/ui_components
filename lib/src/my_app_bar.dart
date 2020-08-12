import 'package:flutter/material.dart';

import 'package:ui_components/src/my_back_button.dart';

class MyAppBar extends StatelessWidget {
  final Color color;
  final double height;
  final Widget rigthButtonBar;
  final Widget leftButtonBar;
  final Widget title;
  final Widget image;
  final double opacityImg;

  const MyAppBar(
      {Key key,
      this.color,
      this.height = 100.0,
      this.rigthButtonBar = const MyBackButton(),
      this.leftButtonBar,
      this.title,
      this.image,
      this.opacityImg = 0.5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: color,
      height: height,
      child: Stack(
        children: <Widget>[
          image != null ? _image() : Container(),
          title != null
              ? Center(
                  child: SafeArea(child: title),
                )
              : Container(),
          Positioned(
            left: 0.0,
            top: size.shortestSide * .01,
            child: rigthButtonBar,
          ),
          this.leftButtonBar != null
              ? Positioned(
                  right: 0.0,
                  top: size.shortestSide * .01,
                  child: leftButtonBar,
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _image() {
    return Stack(children: <Widget>[
      Container(
        width: double.infinity,
        height: this.height,
        child: this.image,
      ),
      Container(
        width: double.infinity,
        height: this.height,
        color: Color.fromRGBO(91, 91, 91, this.opacityImg),
      )
    ]);
  }
}
