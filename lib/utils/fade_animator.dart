import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
// import 'package:simple_animations/stateless_animation/play_animation.dart';
// import 'package:simple_animations/timeline_tween/timeline_tween.dart';

enum AniProp {
  opacity,
  translateY,
}

class FadeAnimation extends StatelessWidget {
  // final double delay;
  final int delay;
  final Widget child;

  FadeAnimation({required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    return PlayAnimationBuilder<double>(
      // delay: Duration(seconds: 3),
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: delay),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
    // final tween = TimelineTween<AniProp>()
    //   ..addScene(begin: Duration.zero, end: Duration(milliseconds: 500))
    //       .animate(AniProp.opacity, tween: Tween(begin: 0.0, end: 1.0))
    //       .animate(AniProp.translateY,
    //       tween: Tween(begin: -30.0, end: 0.0), curve: Curves.easeOut);
    //
    // return PlayAnimation<TimelineValue<AniProp>>(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builder: (context, child, animation) => Opacity(
    //     opacity: animation.get<double>(AniProp.opacity),
    //     child: Transform.translate(
    //         offset: Offset(0, animation.get<double>(AniProp.translateY)),
    //         child: child),
    //   ),
    // );
  }
}