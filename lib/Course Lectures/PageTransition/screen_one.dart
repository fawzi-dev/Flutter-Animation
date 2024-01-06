import 'package:animation1/Course%20Lectures/PageTransition/page_transition_builder.dart';
import 'package:animation1/Course%20Lectures/PageTransition/screen_two.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransitionExample(
                const ScreenTwo(),
              ),
            );
          },
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              color: Colors.indigo,
            ),
            child: Center(
              child: Text(
                '1',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
