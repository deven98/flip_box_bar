import 'package:flutter/material.dart';
import 'flip_box.dart';

/// Class for initialising the FlipBox
class FlipBarElement extends StatelessWidget {
  /// Passing down icon widget from upper widget
  final Widget icon;

  /// Passing down text widget from upper widget
  final Widget text;

  /// Passing down widget from upper widget
  final Color frontColor;

  /// Passing down widget from upper widget
  final Color backColor;

  /// Passing down widget from upper widget
  final AnimationController controller;

  /// Passing down widget from upper widget
  final ValueChanged<int> onTapped;

  /// The index of the box.
  final index;

  /// Passing down widget from upper widget
  final double appBarHeight;

  FlipBarElement(this.icon, this.text, this.frontColor, this.backColor,
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
