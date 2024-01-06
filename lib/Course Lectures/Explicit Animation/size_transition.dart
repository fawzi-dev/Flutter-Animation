import 'package:animation1/String%20paths/constants.dart';
import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class SizeTransitionLecture extends StatefulWidget {
  const SizeTransitionLecture({super.key});

  @override
  State<SizeTransitionLecture> createState() => _SizeTransitionLectureState();
}

class _SizeTransitionLectureState extends State<SizeTransitionLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeTransitionAnimation;
  bool isPositioned = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: kDuration);
    sizeTransitionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.bounceInOut,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
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
        title: const Text('Size Transition'),
      ),
      body: Column(
        children: [
          ColoredBox(
            color: Colors.red,
            child: SizeTransition(
              sizeFactor: sizeTransitionAnimation,
              child: Image.network(
                AssetsPath.jerry,
                width: 200,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isPositioned = !isPositioned;
            isPositioned ? controller.forward() : controller.reverse();
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
