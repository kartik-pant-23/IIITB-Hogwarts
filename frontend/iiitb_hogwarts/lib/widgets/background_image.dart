import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  BackgroundImage({@required this.child});
  final ImageProvider backgroundImage = AssetImage('images/background.jpg');
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}