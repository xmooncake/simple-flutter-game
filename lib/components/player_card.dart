import 'package:flutter/material.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          Text('Username'),
          Text('Score'),
        ],
      ),
    );
  }
}
