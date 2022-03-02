import 'package:flutter/material.dart';
import '../constants.dart';

class WidgetWithLabel extends StatelessWidget {
  final String subscript;
  final String label;
  final Widget widget;
  int value = 0;
  WidgetWithLabel(
      {required this.label,
      required this.widget,
      this.value = 0,
      this.subscript = ''});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kCaptionStyle),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text('$value', style: kNumberStyle),
            Text(subscript, style: kCaptionStyle),
          ],
        ),
        widget,
      ],
    );
  }
}
