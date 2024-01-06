import 'package:animation1/Course%20Intro/second_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Size?> animation;
  late Animation<Rect?> shapeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation = SizeTween(begin: const Size(20, 100), end: const Size(100, 300))
        .animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticInOut,
        reverseCurve: Curves.elasticInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((stat) {
        print('Animation staus changed $stat');
      });

    shapeAnimation = RectTween(
      begin: Rect.fromCircle(center: const Offset(0, 0), radius: 0),
      end: const Rect.fromLTRB(1, 30, 100, 40),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticInOut,
        reverseCurve: Curves.elasticInOut,
      ),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((stat) {
        print('Animation staus changed $stat');
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: animation.value!.height,
                  width: animation.value!.width,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(shapeAnimation.value!.top),
                      topRight: Radius.circular(shapeAnimation.value!.top),
                      bottomRight: Radius.circular(shapeAnimation.value!.right),
                      bottomLeft: Radius.circular(shapeAnimation.value!.left),
                    ),
                  )),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 1000),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return const MySecondHomePage(
                          title: 'My Second Home Page',
                        );
                      },
                    ),
                  );
                },
                child: const Text('Go to Next Page'),
              )
              // Text(
              //   _animationController.value.toStringAsFixed(1),
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              // Text(
              //   'Colorful Text',
              //   style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              //         color: animation.value,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 40,
              //       ),
              // ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _animationController.forward();
                });
              },
              tooltip: 'Forward',
              child: const Icon(Icons.forward),
            ),
            FloatingActionButton(
              onPressed: () {
                _animationController.reverse();
              },
              tooltip: 'Reverse',
              child: const Icon(Icons.reset_tv_rounded),
            ),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
