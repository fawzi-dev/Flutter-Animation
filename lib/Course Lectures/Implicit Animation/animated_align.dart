import 'package:animation1/String%20paths/string_path.dart';
import 'package:flutter/material.dart';

class AnimatedAlignLecture extends StatefulWidget {
  const AnimatedAlignLecture({super.key});

  @override
  State<AnimatedAlignLecture> createState() => _AnimatedAlignLectureState();
}

class _AnimatedAlignLectureState extends State<AnimatedAlignLecture>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int _jerryAligned = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Align'),
      ),
      body: Stack(
        children: [
          AnimatedAlign(
            alignment: _getAlignment(_jerryAligned + 1),
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              child: Image.network(
                AssetsPath.jerry,
                width: 100,
              ),
            ),
          ),
          AnimatedAlign(
            alignment: _getAlignment(_jerryAligned),
            duration: const Duration(milliseconds: 400),
            child: SizedBox(
              child: Image.network(
                AssetsPath.tom,
                width: 100,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _jerryAligned++;
          });
        },
        elevation: 0,
        child: const Icon(Icons.animation_rounded),
      ),
    );
  }

  Alignment _getAlignment(int centerPositioned) {
    switch (centerPositioned) {
      case 1:
        return Alignment.center;
      case 2:
        return Alignment.centerLeft;
      case 3:
        return Alignment.bottomCenter;
      case 4:
        return Alignment.bottomLeft;
      case 5:
        return Alignment.bottomRight;
      case 6:
        return Alignment.topLeft;
      case 7:
        return Alignment.topRight;
      case 8:
        return Alignment.topCenter;
      case 9:
        _jerryAligned = 0;
        return Alignment.center;
      default:
        _jerryAligned = 0;
        return Alignment.center;
    }
  }
}
