import 'package:flutter/material.dart';

class ReceivedPoints extends StatelessWidget {
  const ReceivedPoints({required this.receivedPoints});

  final int receivedPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Punkty wylosowane w tej rundzie:',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Text(
          receivedPoints.toString(),
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
