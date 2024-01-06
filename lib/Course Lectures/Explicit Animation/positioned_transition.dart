import 'package:animation1/String%20paths/constants.dart';
import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class PositionedTransitionLecture extends StatefulWidget {
  const PositionedTransitionLecture({super.key});

  @override
  State<PositionedTransitionLecture> createState() =>
      _PositionedTransitionLectureState();
}

class _PositionedTransitionLectureState
    extends State<PositionedTransitionLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<RelativeRect> animationRed;
  late Animation<RelativeRect> animationBlue;
  late Animation<RelativeRect> animationYellow;
  bool isPositioned = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this, duration: kDuration);

    animationRed = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(150, 150, 0, 0),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    )..addListener(() {
        setState(() {});
      });

    animationBlue = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(100, 100, 0, 0),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    )..addListener(() {
        setState(() {});
      });

    animationYellow = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 0, 0),
      end: const RelativeRect.fromLTRB(50, 50, 0, 0),
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    )..addListener(() {
        setState(() {});
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
        title: const Text('Positioned Transition'),
      ),
      body: Stack(
        //alignment: Alignment.center,
        children: [
          PositionedTransition(
            rect: animationYellow,
            child: Container(
              color: Colors.grey,
              child: Image.network(AssetsPath.spike),
            ),
          ),
          PositionedTransition(
            rect: animationBlue,
            child: Container(
              color: Colors.blue,
              child: Image.network(AssetsPath.tom),
            ),
          ),
          PositionedTransition(
            rect: animationRed,
            child: Container(
              color: Colors.red,
              child: Image.network(AssetsPath.jerry),
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
