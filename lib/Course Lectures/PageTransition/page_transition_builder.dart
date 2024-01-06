import 'package:flutter/material.dart';

class PageTransitionExample extends PageRouteBuilder {
  dynamic page;
  AnimationTypes animationTypes;

  PageTransitionExample(this.page, this.animationTypes)
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const offsetBegin = Offset(1.0, 0.0);
            const offsetEnd = Offset.zero;
            const beginOpacity = 0.0;
            const endOpacity = 1.0;

            const curves = Curves.decelerate;
            const reverseCurves = Curves.decelerate;

            // Sliding page transition
            var slideTransition =
                Tween(begin: offsetBegin, end: offsetEnd).animate(
              CurvedAnimation(
                parent: animation,
                curve: curves,
                reverseCurve: reverseCurves,
              ),
            );

            var fadeTransition =
                Tween<double>(begin: beginOpacity, end: endOpacity).animate(
              CurvedAnimation(parent: animation, curve: curves),
            );

            var scaleTransition =
                Tween<double>(begin: beginOpacity, end: endOpacity).animate(
              CurvedAnimation(parent: animation, curve: curves),
            );

            var rotationTransition =
                Tween<double>(begin: beginOpacity, end: endOpacity).animate(
              CurvedAnimation(parent: animation, curve: curves),
            );

            if (animationTypes == AnimationTypes.slide) {
              return Align(
                alignment: Alignment.center,
                child: SlideTransition(
                  position: slideTransition,
                  child: child,
                ),
              );
            } else if (animationTypes == AnimationTypes.fade) {
              return Align(
                alignment: Alignment.center,
                child: FadeTransition(
                  opacity: fadeTransition,
                  child: child,
                ),
              );
            } else if (animationTypes == AnimationTypes.scale) {
              return Align(
                alignment: Alignment.center,
                child: ScaleTransition(
                  scale: scaleTransition,
                  child: child,
                ),
              );
            } else if (animationTypes == AnimationTypes.rotation) {
              return Align(
                alignment: Alignment.center,
                child: RotationTransition(
                  turns: rotationTransition,
                  child: child,
                ),
              );
            } else {
              return Align(
                alignment: Alignment.center,
                child: child,
              );
            }

            // return Align(
            //   alignment: Alignment.center,
            //   child: SlideTransition(
            //     position: slideTransition,
            //     child: FadeTransition(
            //       opacity: fadeTransition,
            //       child: ScaleTransition(
            //         scale: scaleTransition,
            //         child: RotationTransition(
            //           turns: rotationTransition,
            //           child: child,
            //         ),
            //       ),
            //     ),
            //   ),
            // );
          },
        );
}

enum AnimationTypes { slide, fade, scale, rotation }
