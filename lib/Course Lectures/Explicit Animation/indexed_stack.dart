import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class IndexedStackAnimationLecture extends StatefulWidget {
  const IndexedStackAnimationLecture({super.key});

  @override
  State<IndexedStackAnimationLecture> createState() =>
      _IndexedStackAnimationLectureState();
}

class _IndexedStackAnimationLectureState
    extends State<IndexedStackAnimationLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _opacity;
  late Animation<double> _scale;

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.decelerate),
    );

    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  void _goToNextPage() {
    currentIndex++;
    if (currentIndex == 3) {
      currentIndex = 0;
    }
    setState(() {
      controller.reset();
      controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          ColoredBox(
            color: Colors.deepOrange,
            child: ScaleTransition(
              scale: _scale,
              child: FadeTransition(
                opacity: _opacity,
                child: Image.network(
                  AssetsPath.jerry,
                ),
              ),
            ),
          ),
          ColoredBox(
            color: Colors.grey,
            child: ScaleTransition(
              scale: _scale,
              child: Image.network(
                AssetsPath.tom,
              ),
            ),
          ),
          ColoredBox(
            color: Colors.blueGrey,
            child: ScaleTransition(
              scale: _scale,
              child: Image.network(
                AssetsPath.spike,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToNextPage,
        child: const Icon(
          Icons.arrow_forward,
        ),
      ),
    );
  }
}
