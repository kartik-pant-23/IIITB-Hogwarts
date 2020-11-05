import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 100, width: 100,
            child: SvgPicture.asset('images/ic_default_profile.svg', fit: BoxFit.cover,)),
        SizedBox(height: 5,),
        SizedBox(width: 100, height: 3,
            child: LinearProgressIndicator())
      ],
    )));
  }
}
