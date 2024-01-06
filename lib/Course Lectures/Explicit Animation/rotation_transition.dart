import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class RotationTransitionLecture extends StatefulWidget {
  const RotationTransitionLecture({super.key});

  @override
  State<RotationTransitionLecture> createState() =>
      _RotationTransitionLectureState();
}

class _RotationTransitionLectureState extends State<RotationTransitionLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotationTransitionAnimation;
  bool isPositioned = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    rotationTransitionAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.decelerate,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rotation Transition'),
      ),
      body: Column(
        children: [
          RotationTransition(
            turns: rotationTransitionAnimation,
            child: Image.network(
              AssetsPath.jerry,
              width: 200,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(mounted){
            setState(() {
            isPositioned = !isPositioned;
            isPositioned ? controller.forward() : controller.reverse();
          });
          }
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
