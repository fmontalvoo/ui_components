import 'package:flutter/material.dart';

import 'package:ui_components/ui_components.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
    this.color,
    this.height = 100,
    this.rigthButtonBar = const MyBackButton(),
    this.leftButtonBar,
    this.title,
    this.image,
    this.opacityImg = const Color.fromRGBO(91, 91, 91, 0.5),
    this.appBarBorderRadius,
    this.gradient,
    this.tag = '',
  }) : super(key: key);

  final Color? color;
  final double height;
  final Widget rigthButtonBar;
  final Widget? leftButtonBar;
  final Widget? title;
  final ImageProvider<dynamic>? image;
  final Color opacityImg;
  final BorderRadiusGeometry? appBarBorderRadius;
  final Gradient? gradient;
  final Object tag;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: appBarBorderRadius,
        gradient: gradient,
      ),
      height: height,
      child: Stack(
        children: <Widget>[
          image != null ? _image() : const SizedBox(),
          title != null
              ? Center(
                  child: SafeArea(child: title!),
                )
              : const SizedBox(),
          Positioned(
            left: 0.0,
            top: size.shortestSide * .01,
            child: rigthButtonBar,
          ),
          leftButtonBar != null
              ? Positioned(
                  right: 0,
                  top: size.shortestSide * .01,
                  child: leftButtonBar!,
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _image() {
    return Stack(children: <Widget>[
      Center(
        child: Hero(
          tag: tag,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: appBarBorderRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: image as ImageProvider<Object>,
                )),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: opacityImg,
          borderRadius: appBarBorderRadius,
        ),
        width: double.infinity,
        height: height,
      )
    ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
