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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isVisible = true;
          });
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
          setState(() {
            isVisible = false;
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
