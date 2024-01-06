import 'package:animation1/String%20paths/constants.dart';
import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedLecture extends StatefulWidget {
  const AnimatedPositionedLecture({super.key});

  @override
  State<AnimatedPositionedLecture> createState() =>
      _AnimatedPositionedLectureState();
}

class _AnimatedPositionedLectureState extends State<AnimatedPositionedLecture> {
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
        title: const Text('Animated Positioned'),
      ),
      body: GestureDetector(
        onTap: () {
          startAnimation();
        },
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: 100,
                child: Image.network(AssetsPath.cheese),
              ),
            ),
            AnimatedPositioned(
              top: isVisible ? 600 : 0,
              left: 20,
              duration: kDuration,
              child: SizedBox(
                width: 100,
                child: Image.network(AssetsPath.tom),
              ),
            ),
            AnimatedPositioned(
              left: isVisible ? 300 : 0,
              duration: kDuration - const Duration(milliseconds: 200),
              child: SizedBox(
                width: 100,
                child: Image.network(
                  AssetsPath.jerry,
                ),
              ),
            ),
            AnimatedPositioned(
              top: isVisible ? 100 : 0,
              duration: kDuration,
              left: isVisible ? 150 : 0,
              child: SizedBox(
                width: 100,
                child: Image.network(AssetsPath.spike),
              ),
            ),
          ],
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
