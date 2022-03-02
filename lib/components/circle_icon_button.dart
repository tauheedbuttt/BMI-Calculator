import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;
  CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        child: FaIcon(
          icon,
          size: 30.0,
          color: Colors.white,
        ),
        backgroundColor: kIconButtonColor,
        radius: 28.0,
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
