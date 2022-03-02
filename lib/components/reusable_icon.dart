import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class ReusableIcon extends StatelessWidget {
  final String caption;
  final IconData icon;
  ReusableIcon({required this.icon, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, size: 80.0),
        SizedBox(height: 10.0),
        Text(
          caption,
          style: kCaptionStyle,
        ),
      ],
    );
  }
}
