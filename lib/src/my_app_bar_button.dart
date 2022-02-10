import 'package:flutter/material.dart';

class MyAppBarButton extends StatelessWidget {
  const MyAppBarButton({
    Key? key,
    this.icon,
    this.heroTag = '',
    this.elevation = 1,
    this.backgroundColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  final Widget? icon;
  final Object heroTag;
  final double elevation;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: _floatingActionButton(context),
      ),
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
        heroTag: heroTag,
        backgroundColor: backgroundColor,
        elevation: elevation,
        mini: true,
        child: icon,
        onPressed: onPressed);
  }
}
