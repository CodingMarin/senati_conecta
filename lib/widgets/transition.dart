import 'package:flutter/material.dart';

class Slide extends PageRouteBuilder {
  final Widget widget;

  Slide(this.widget)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => widget,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
      );
      return SlideTransition(
        position: Tween(
          begin: const Offset(1.0, 0.0),
          end: const Offset(0.0, 0.0),
        ).animate(animation),
        child: widget,
      );
    },
  );
}