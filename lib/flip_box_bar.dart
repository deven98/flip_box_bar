library flip_box_bar;

import 'flip_box.dart';
import 'package:flutter/material.dart';

class FlipBoxBar extends StatefulWidget {
  final List<FlipBarItem> items;
  final Duration animationDuration;
  final ValueChanged<int> onIndexChanged;
  final int initialIndex;
  final double navBarHeight;

  FlipBoxBar({
    this.items,
    this.animationDuration = const Duration(seconds: 1),
    @required this.onIndexChanged,
    this.initialIndex = 0,
    this.navBarHeight = 100.0,
  });

  @override
  _FlipBoxBarState createState() => _FlipBoxBarState();
}

class _FlipBoxBarState extends State<FlipBoxBar> with TickerProviderStateMixin {
  List<AnimationController> _controllers = [];
  int indexChosen = 0;

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.items.length; i++) {
      _controllers.add(
          AnimationController(vsync: this, duration: widget.animationDuration));
    }

    _controllers[widget.initialIndex].forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: Row(
        children: widget.items.map((item) {
          int index = widget.items.indexOf(item);

          return Expanded(
            child: _FlipBarElement(
              item.icon,
              item.text,
              item.frontColor,
              item.backColor,
              _controllers[index],
              _onTapped,
              index,
              widget.navBarHeight,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _onTapped(int index) {
    _controllers[indexChosen].reverse();
    indexChosen = index;
    _controllers[indexChosen].forward();
  }
}

class FlipBarItem {
  final Widget icon;
  final Widget text;
  final Color frontColor;
  final Color backColor;

  FlipBarItem({
    @required this.icon,
    @required this.text,
    this.frontColor = Colors.blueAccent,
    this.backColor = Colors.blue,
  });
}

class _FlipBarElement extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final Color frontColor;
  final Color backColor;
  final AnimationController controller;
  final ValueChanged<int> onTapped;
  final index;
  final double appBarHeight;

  _FlipBarElement(this.icon, this.text, this.frontColor, this.backColor,
      this.controller, this.onTapped, this.index, this.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return FlipBox(
      controller: controller,
      bottomChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: backColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            text,
          ],
        ),
      ),
      topChild: Container(
        width: double.infinity,
        height: double.infinity,
        color: frontColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
          ],
        ),
      ),
      onTapped: () {
        onTapped(index);
      },
      height: appBarHeight,
    );
  }
}
