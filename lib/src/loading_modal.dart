import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class LoadingModal {
  final BuildContext context;
  final double opacity;
  final double radius;
  LoadingModal(this.context, {this.opacity = 0.7, this.radius = 20.0});

  void show() {
    showCupertinoModalPopup(
      context: this.context,
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
