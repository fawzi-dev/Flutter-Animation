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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Padding'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isPadded = true;
          });
        },
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          children: List.generate(
            4,
            (index) => AnimatedPadding(
              duration: kDuration,
              padding: isPadded
                  ? const EdgeInsets.all(4)
                  : const EdgeInsets.all(20),
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
          setState(() {
            isPadded = false;
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
