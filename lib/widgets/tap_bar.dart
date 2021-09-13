import 'package:flutter/material.dart';

class TapBar extends StatelessWidget {
  final IconData icon;
  final Color color;

  const TapBar({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
