import 'package:animation1/String%20paths/constants.dart';
import 'package:flutter/material.dart';

class AnimatedTextStyleLecture extends StatefulWidget {
  const AnimatedTextStyleLecture({super.key});

  @override
  State<AnimatedTextStyleLecture> createState() =>
      _AnimatedTextStyleLectureState();
}

class _AnimatedTextStyleLectureState extends State<AnimatedTextStyleLecture> {
  TextStyle textStyle = const TextStyle(
    fontSize: 16,
    color: Colors.deepOrange,
    decorationStyle: TextDecorationStyle.double,
    letterSpacing: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            textStyle = const TextStyle(
              fontSize: 30,
              color: Colors.indigo,
              decorationStyle: TextDecorationStyle.dotted,
              letterSpacing: 14,
            );
          });
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: kDuration,
            style: textStyle,
            child: const Text('Text'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textStyle = const TextStyle(
              fontSize: 16,
              color: Colors.deepOrange,
              decorationStyle: TextDecorationStyle.double,
              letterSpacing: 0,
            );
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
