import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  const GameScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          round: 1,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[300],
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlayerCard(
                  username: 'Gracz',
                  score: 0,
                ),
                SizedBox(width: 150),
                PlayerCard(
                  username: 'Komputer',
                  score: 0,
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GameButton(
                  label: 'Przycisk 1',
                ),
                SizedBox(width: 20),
                GameButton(
                  label: 'Przycisk 2',
                ),
                SizedBox(width: 20),
                GameButton(
                  label: 'Przycisk 3',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GameButton extends StatelessWidget {
  const GameButton({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      color: Colors.brown,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'przycisk 1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    super.key,
    required this.username,
    required this.score,
  });

  final String username;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      color: Colors.red,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Gracz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                score.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
