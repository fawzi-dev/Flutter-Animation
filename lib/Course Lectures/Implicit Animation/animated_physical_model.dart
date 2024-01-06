import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

import '../../String paths/constants.dart';

class AnimatedPhysicalModelLecture extends StatefulWidget {
  const AnimatedPhysicalModelLecture({super.key});

  @override
  State<AnimatedPhysicalModelLecture> createState() =>
      _AnimatedPhysicalModelLectureState();
}

class _AnimatedPhysicalModelLectureState
    extends State<AnimatedPhysicalModelLecture> {
  bool isVisible = false;

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
        title: const Text('Animated Physical Model'),
      ),
      body: GestureDetector(
        onTap: () {
          startAnimation();
        },
        child: Center(
          child: AnimatedPhysicalModel(
            shape: BoxShape.rectangle,
            elevation: isVisible ? 100 : 0,
            color: Colors.deepOrange,
            shadowColor: Colors.deepOrange,
            duration: kDuration,
            child: SizedBox(
              width: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(AssetsPath.jerry),
              ),
            ),
          ),
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
