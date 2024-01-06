import 'dart:math';

import 'package:animation1/String%20paths/constants.dart';
import 'package:flutter/material.dart';

import '../../String paths/string_path.dart';

class AnimatedBuilderLecture extends StatefulWidget {
  const AnimatedBuilderLecture({super.key});

  @override
  State<AnimatedBuilderLecture> createState() => _AnimatedBuilderLectureState();
}

class _AnimatedBuilderLectureState extends State<AnimatedBuilderLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isForward = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: kDuration)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) => Transform.rotate(
          angle: animationController.value * 2 * pi,
          child: Image.network(AssetsPath.jerry),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isForward = !isForward;
          setState(() {
            isForward
                ? animationController.forward()
                : animationController.reverse();
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
