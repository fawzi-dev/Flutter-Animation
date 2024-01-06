import 'package:animation1/String%20paths/constants.dart';
import 'package:flutter/material.dart';

class AnimiatedSwitcherLecture extends StatefulWidget {
  const AnimiatedSwitcherLecture({super.key});

  @override
  State<AnimiatedSwitcherLecture> createState() =>
      _AnimiatedSwitcherLectureState();
}

class _AnimiatedSwitcherLectureState extends State<AnimiatedSwitcherLecture> {
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
        title: const Text('Animated Switcher'),
      ),
      body: GestureDetector(
        onTap: () {
          startAnimation();
        },
        child: AnimatedSwitcher(
          duration: kDuration,
          switchInCurve: Curves.decelerate,
          switchOutCurve: Curves.decelerate,
          transitionBuilder: (child, animation) {
            return SizeTransition(
              sizeFactor: animation,
              child: child,
            );
          },
          child: isVisible
              ? ListView(
                  children: List.generate(
                    Colors.primaries.length,
                    (index) => ColoredBox(
                      color: Colors.primaries[index],
                      child: Center(
                          child: Text(
                        '$index',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
                    ),
                  ),
                )
              : GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: List.generate(
                    Colors.primaries.length,
                    (index) => ColoredBox(
                      color: Colors.primaries[index],
                      child: Center(
                          child: Text(
                        '$index',
                        style:
                            const TextStyle(fontSize: 20, color: Colors.white),
                      )),
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
