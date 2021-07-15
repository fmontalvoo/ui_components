import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final bool showCamera;
  final Color color;
  final double width;
  final double height;
  final ImageProvider<dynamic> backgroundImage;
  final void Function() onPressed;

  ProfilePicture({
    Key key,
    this.showCamera: false,
    this.color: Colors.grey,
    this.width: 120.0,
    this.height: 120.0,
    this.backgroundImage,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: width,
                  height: height,
                  child: CircleAvatar(
                    backgroundImage: backgroundImage,
                  ),
                ),
                showCamera
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        child: FloatingActionButton(
                            mini: true,
                            heroTag: '44c3bcbadcd040485e64c2f7e221a36879314408',
                            backgroundColor: color,
                            child: Icon(Icons.camera_alt),
                            onPressed: onPressed),
                      )
                    : SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
