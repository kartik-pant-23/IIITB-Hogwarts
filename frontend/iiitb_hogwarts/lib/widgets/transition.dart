import 'package:flutter/material.dart';

class SlideRightRouteBounce extends PageRouteBuilder {
  final Widget widget;
  SlideRightRouteBounce({this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 1000),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(-1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  );
}

class SlideLeftRouteBounce extends PageRouteBuilder {
  final Widget widget;
  SlideLeftRouteBounce({this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 900),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  );
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget widget;
  SlideLeftRoute({this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 200),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        animation = CurvedAnimation(parent: animation, curve: Curves.easeIn);
        return new SlideTransition(
          position: new Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      }
  );
}