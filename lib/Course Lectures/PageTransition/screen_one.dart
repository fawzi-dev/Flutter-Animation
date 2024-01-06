import 'package:animation1/Course%20Lectures/PageTransition/page_transition_builder.dart';
import 'package:animation1/Course%20Lectures/PageTransition/screen_two.dart';
import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key, required this.types});
  final AnimationTypes types;

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
                types,
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Click Me !',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'This is screen 1',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.amber),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
