import 'package:flutter/material.dart';

import '../../String paths/constants.dart';

class DefaultTextStyleAnimationLecture extends StatefulWidget {
  const DefaultTextStyleAnimationLecture({super.key});

  @override
  State<DefaultTextStyleAnimationLecture> createState() =>
      _DefaultTextStyleAnimationLectureState();
}

class _DefaultTextStyleAnimationLectureState
    extends State<DefaultTextStyleAnimationLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  bool isForward = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(vsync: this, duration: kDuration);
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.elasticIn),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle1 =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 40);
    TextStyle textStyle2 =
        Theme.of(context).textTheme.titleMedium!.copyWith(letterSpacing: 10);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Textstyle'),
      ),
      body: Center(
        child: DefaultTextStyleTransition(
          style: animation
              .drive(TextStyleTween(begin: textStyle1, end: textStyle2)),
          child: const Text('This is animated text'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isForward = !isForward;
          setState(() {
            isForward
                ? animationController.forward()
                : animationController.reverse();
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
