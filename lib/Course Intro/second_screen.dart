import 'package:flutter/material.dart';

import 'course_intro.dart';

class MySecondHomePage extends StatefulWidget {
  const MySecondHomePage({super.key, required this.title});

  final String title;

  @override
  State<MySecondHomePage> createState() => _MySecondHomePageState();
}

class _MySecondHomePageState extends State<MySecondHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Size?> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    animation =
        SizeTween(begin: const Size(20, 100), end: const Size(100, 20)).animate(
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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: animation.value!.height,
                width: animation.value!.width,
                color: Colors.amber,
              ),

              TextButton(
                onPressed: () {
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                    return const MyHomePage(
                      title: 'ss',
                    );
                  });
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
