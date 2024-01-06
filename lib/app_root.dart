import 'package:animation1/Course%20Lectures/Explicit%20Animation/animated_builder.dart';
import 'package:animation1/Course%20Lectures/Explicit%20Animation/default_text_style.dart';
import 'package:animation1/Course%20Lectures/Explicit%20Animation/indexed_stack.dart';
import 'package:animation1/Course%20Lectures/Explicit%20Animation/positioned_transition.dart';
import 'package:animation1/Course%20Lectures/Explicit%20Animation/rotation_transition.dart';
import 'package:animation1/Course%20Lectures/Explicit%20Animation/tween_animation_builder.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_align.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_container.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_list.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_opacity.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_padding.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_physical_model.dart';
import 'package:animation1/Course%20Lectures/Implicit%20Animation/animated_switcher.dart';
import 'package:animation1/Course%20Lectures/PageTransition/page_transition_builder.dart';
import 'package:animation1/Course%20Lectures/PageTransition/screen_one.dart';
import 'package:flutter/material.dart';

import 'Course Lectures/Explicit Animation/size_transition.dart';
import 'Course Lectures/Implicit Animation/animated_positioned.dart';
import 'Course Lectures/Implicit Animation/animated_textsyle.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  Map<String, Widget> implicitAnimationLecture = {
    'Align': const AnimatedAlignLecture(),
    'Container': const AnimatedContainerLecture(),
    'TextStyle': const AnimatedTextStyleLecture(),
    'Opacity': const AnimatedOpactiyLecture(),
    'Padding': const AnimatedPaddingLecture(),
    'Physical Modal': const AnimatedPhysicalModelLecture(),
    'Positioned': const AnimatedPositionedLecture(),
    'Switcher': const AnimiatedSwitcherLecture(),
    'List': const AnimatedListLecture()
  };

  Map<String, Widget> explicitAnimationLecture = {
    'Positioned Transition': const PositionedTransitionLecture(),
    'Size Transition': const SizeTransitionLecture(),
    'Rotation Transition': const RotationTransitionLecture(),
    'Animated Builder': const AnimatedBuilderLecture(),
    'Tween Animation Builder': const TweenAnimationBuilderLecture(),
    'Default Textstyle Animation': const DefaultTextStyleAnimationLecture(),
    'Indexed Animation': const IndexedStackAnimationLecture(),
  };

  Map<String, Widget> pageAnimationLecture = {
    'Fade Page Transition': const ScreenOne(
      types: AnimationTypes.fade,
    ),
    'Scale Page Transition': const ScreenOne(
      types: AnimationTypes.scale,
    ),
    'Rotation Page Transition': const ScreenOne(
      types: AnimationTypes.rotation,
    ),
    'Slide Page Transition': const ScreenOne(
      types: AnimationTypes.slide,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Animation'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                LectureTile(
                  listOfLectures: implicitAnimationLecture,
                  label: 'Implicit Animation',
                  animationColor: Colors.indigo,
                ),
                LectureTile(
                  listOfLectures: explicitAnimationLecture,
                  label: 'Explicit Animation',
                  animationColor: Colors.redAccent,
                ),
                LectureTile(
                  listOfLectures: pageAnimationLecture,
                  label: 'Page Transition',
                  animationColor: Colors.deepOrange,
                )
              ],
            ),
          ),
        ));
  }
}

class LectureTile extends StatelessWidget {
  const LectureTile({
    super.key,
    required this.listOfLectures,
    required this.label,
    required this.animationColor,
  });

  final Map<String, Widget> listOfLectures;
  final String label;
  final Color animationColor;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: Text(label),
      children: List.generate(
        listOfLectures.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => listOfLectures.values.elementAt(index),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 1.5),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: animationColor,
              ),
              child: Text(
                label == 'Implicit Animation'
                    ? 'Animated ${listOfLectures.keys.elementAt(index)} '
                    : listOfLectures.keys.elementAt(index),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
