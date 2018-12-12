import 'package:flutter/material.dart';
import 'dart:math';

class FlipBox extends StatefulWidget {
  final Widget bottomChild;
  final Widget topChild;
  final bool isFlipped;
  final double height;
  final AnimationController controller;
  final VoidCallback onTapped;

  FlipBox({
    this.bottomChild,
    this.topChild,
    this.isFlipped = false,
    this.height = 100.0,
    this.controller,
    this.onTapped,
  });

  @override
  _FlipBoxState createState() => _FlipBoxState();
}

class _FlipBoxState extends State<FlipBox> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      controller = AnimationController(
          vsync: this, duration: Duration(milliseconds: 2000));
    } else {
      controller = widget.controller;
    }
    animation = Tween(begin: 0.0, end: pi / 2).animate(
      CurvedAnimation(parent: controller, curve: Curves.elasticInOut),
    );

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              controller.reverse();
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(0.0, -(cos(animation.value) * (widget.height / 2)),
                    ((-widget.height / 2) * sin(animation.value)))
                ..rotateX(-(pi / 2) + animation.value),
              child: Container(
                child: Center(child: widget.bottomChild),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              widget.onTapped();
              controller.forward();
            },
            child: animation.value < (85 * pi / 180)
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..translate(
                        0.0,
                        (widget.height / 2) * sin(animation.value),
                        -((widget.height / 2) * cos(animation.value)),
                      )
                      ..rotateX(animation.value),
                    child: Container(
                      child: Center(child: widget.topChild),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
