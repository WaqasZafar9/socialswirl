import 'package:flutter/material.dart';

enum AnimationType {
  leftToRight,
  rightToLeft,
  topToBottom,
  bottomToTop,
  fade,
  scale,
  rotation
}

class AnimatedPageRoute {
  static PageRouteBuilder getAnimatedPageRoute(Widget page, AnimationType type) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (type) {
          case AnimationType.leftToRight:
            return _buildSlideTransition(animation, child, const Offset(-1.0, 0.0), const Offset(0.0, 0.0));
          case AnimationType.rightToLeft:
            return _buildSlideTransition(animation, child, const Offset(1.0, 0.0), const Offset(0.0, 0.0));
          case AnimationType.topToBottom:
            return _buildSlideTransition(animation, child, const Offset(0.0, -1.0), const Offset(0.0, 0.0));
          case AnimationType.bottomToTop:
            return _buildSlideTransition(animation, child, const Offset(0.0, 1.0), const Offset(0.0, 0.0));
          case AnimationType.fade:
            return FadeTransition(opacity: animation, child: child);
          case AnimationType.scale:
            return ScaleTransition(scale: animation, child: child);
          case AnimationType.rotation:
            return RotationTransition(
              turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
        }
      },
    );
  }

  static Widget _buildSlideTransition(Animation<double> animation, Widget child, Offset begin, Offset end) {
    return SlideTransition(
      position: Tween<Offset>(begin: begin, end: end).animate(animation),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}