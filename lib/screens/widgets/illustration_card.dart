import 'package:flutter/material.dart';

class IllustrationCard extends StatelessWidget {
  final Color color;
  final IconData icon;

  const IllustrationCard({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: Icon(icon, size: 48, color: Colors.white)),
    );
  }
}
