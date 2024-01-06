import 'package:flutter/material.dart';

import '../../String paths/constants.dart';

class TweenAnimationBuilderLecture extends StatefulWidget {
  const TweenAnimationBuilderLecture({super.key});

  @override
  State<TweenAnimationBuilderLecture> createState() =>
      _TweenAnimationBuilderLectureState();
}

class _TweenAnimationBuilderLectureState
    extends State<TweenAnimationBuilderLecture> {
  double opactiyLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: TweenAnimationBuilder<double>(
        builder: (BuildContext context, double value, Widget? child) {
          return Opacity(
            opacity: value,
            child: child,
          );
        },
        duration: kDuration,
        tween: Tween(begin: 0.0, end: opactiyLevel),
        child: Container(
          height: 200,
          width: 300,
          color: Colors.red,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opactiyLevel = opactiyLevel == 0 ? 1.0 : 0.0;
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
