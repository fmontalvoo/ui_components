import 'package:flutter/material.dart';

class MyAppBarButton extends StatelessWidget {
  final Icon icon;
  final String heroTag;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const MyAppBarButton(
      {Key key,
      this.icon,
      this.heroTag,
      this.backgroundColor: Colors.white,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: EdgeInsets.all(8.0), child: _floatingActionButton(context)),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: backgroundColor,
        elevation: 10.0,
        mini: true,
        child: icon,
        onPressed: onPressed);
  }
}