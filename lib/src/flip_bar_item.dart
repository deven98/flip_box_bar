import 'package:flutter/material.dart';

/// Template for a [FlipBoxBar] item.
class FlipBarItem {
  /// The icon to be displayed on the sides (Can be replaced by any other widget).
  final Widget icon;

  /// The text to be displayed when item is selected (Can be replaced by any other widget).
  final Widget text;

  /// The color of the front side (Originally towards the user).
  final Color frontColor;

  /// The color of the top side (Towards the user when selected).
  final Color backColor;

  FlipBarItem({
    @required this.icon,
    @required this.text,
    this.frontColor = Colors.blueAccent,
    this.backColor = Colors.blue,
  });
}
