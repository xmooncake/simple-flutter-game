import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.round,
  });

  final int round;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Runda: $round',
      style: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
