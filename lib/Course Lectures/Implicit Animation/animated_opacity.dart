import 'package:animation1/String%20paths/constants.dart';
import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class AnimatedOpactiyLecture extends StatefulWidget {
  const AnimatedOpactiyLecture({super.key});

  @override
  State<AnimatedOpactiyLecture> createState() => _AnimatedOpactiyLectureState();
}

class _AnimatedOpactiyLectureState extends State<AnimatedOpactiyLecture> {
  bool isVisible = true;

  void startAnimation() {
    if (mounted) {
      setState(() {
        isVisible = !isVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
      ),
      body: GestureDetector(
        onTap: () {
          startAnimation();
        },
        child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          curve: Curves.decelerate,
          duration: kDuration,
          child: Image.network(AssetsPath.jerry),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startAnimation();
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
