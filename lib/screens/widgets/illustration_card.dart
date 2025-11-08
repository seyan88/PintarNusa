import 'package:flutter/material.dart';

class IllustrationCard extends StatelessWidget {
  final Color color;
  final IconData icon;

  const IllustrationCard({
    Key? key,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(icon, size: 48, color: Colors.white),
      ),
    );
  }
}