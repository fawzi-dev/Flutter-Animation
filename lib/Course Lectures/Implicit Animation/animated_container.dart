import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class AnimatedContainerLecture extends StatefulWidget {
  const AnimatedContainerLecture({super.key});

  @override
  State<AnimatedContainerLecture> createState() =>
      AnimatedContainerLectureState();
}

class AnimatedContainerLectureState extends State<AnimatedContainerLecture> {
  Color containerColor = Colors.grey;

  Size containerSize = const Size(100, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            containerColor = Colors.indigo;
            containerSize = const Size(300, 300);
          });
        },
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(
              milliseconds: 450,
            ),
            color: containerColor,
            height: containerSize.height,
            width: containerSize.width,
            child: Stack(
              children: [
                Image.network(AssetsPath.jerry),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            containerColor = Colors.grey;

            containerSize = const Size(100, 100);
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
