import 'package:animation1/String%20paths/constants.dart';
import 'package:flutter/material.dart';

class AnimatedListLecture extends StatefulWidget {
  const AnimatedListLecture({super.key});

  @override
  State<AnimatedListLecture> createState() => _AnimatedListLectureState();
}

class _AnimatedListLectureState extends State<AnimatedListLecture> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> coloredBox = [
      const ColoredBox(
        color: Colors.indigo,
        child: Center(
          child: Text(
            'Item',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
      const ColoredBox(
        color: Colors.indigo,
        child: Center(
          child: Text(
            'Item',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: coloredBox.length,
        itemBuilder: ((context, index, animation) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, -0.5),
              end: const Offset(0, 0),
            ).animate(animation),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: coloredBox[index],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          coloredBox.insert(
            0,
            ColoredBox(
              color: Colors.indigo,
              child: Center(
                child: Text(
                  '${coloredBox.length + 1}',
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          );
          _listKey.currentState!.insertItem(0, duration: kDuration);
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }
}
