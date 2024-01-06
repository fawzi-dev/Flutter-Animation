import 'package:animation1/String%20paths/constants.dart';
import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class AnimatedPaddingLecture extends StatefulWidget {
  const AnimatedPaddingLecture({super.key});

  @override
  State<AnimatedPaddingLecture> createState() => _AnimatedPaddingLectureState();
}

class _AnimatedPaddingLectureState extends State<AnimatedPaddingLecture> {
  bool isPadded = true;

  void startAnimation() {
    if (mounted) {
      setState(() {
        isPadded = !isPadded;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding'),
      ),
      body: GestureDetector(
        onTap: () {
          startAnimation();
        },
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: List.generate(
            4,
            (index) => AnimatedPadding(
              duration: kDuration,
              padding:
                  isPadded ? const EdgeInsets.all(4) : const EdgeInsets.all(20),
              child: ColoredBox(
                color: Colors.amber,
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
