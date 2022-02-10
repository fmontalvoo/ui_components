import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    this.showCamera = false,
    this.color = Colors.grey,
    this.width = 120,
    this.height = 120,
    this.backgroundImage,
    this.onPressed,
  }) : super(key: key);

  final bool showCamera;
  final Color color;
  final double width;
  final double height;
  final ImageProvider<dynamic>? backgroundImage;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: width,
                  height: height,
                  child: CircleAvatar(
                    backgroundImage: backgroundImage as ImageProvider<Object>?,
                  ),
                ),
                showCamera
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: FloatingActionButton(
                          mini: true,
                          heroTag: 'NjY2NzZkNmYwYQo=',
                          backgroundColor: color,
                          child: const Icon(Icons.camera_alt),
                          onPressed: onPressed,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
