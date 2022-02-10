import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingModal {
  LoadingModal(
    this.context, {
    this.opacity = 0.7,
    this.radius = 20.0,
  });

  final BuildContext context;
  final double opacity;
  final double radius;

  void show() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(opacity),
        child: CupertinoActivityIndicator(
          radius: radius,
        ),
      ),
    );
  }

  void dismiss() {
    Navigator.pop(context);
  }
}
