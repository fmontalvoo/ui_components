import 'package:flutter/material.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    Key? key,
    this.backgroundColor = Colors.white,
    this.arrowColor = Colors.black,
    this.elevation,
    this.heroTag = 'back',
  }) : super(key: key);

  final Color backgroundColor;
  final Color arrowColor;
  final double? elevation;
  final Object heroTag;

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
      child: _BackButtonIcon(
        color: arrowColor,
      ),
      onPressed: () => Navigator.maybePop(context),
    );
  }
}

class _BackButtonIcon extends StatelessWidget {
  final Color? color;
  const _BackButtonIcon({
    Key? key,
    this.color,
  }) : super(key: key);

  static IconData? _getIconData(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Icons.arrow_back_rounded;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Icons.arrow_back_ios_rounded;
    }
  }

  @override
  Widget build(BuildContext context) => Icon(
        _getIconData(Theme.of(context).platform),
        color: color,
      );
}
