import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  Widget child;
  BackgroundImage({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: child,
    );
  }
}
