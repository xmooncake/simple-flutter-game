import 'package:flutter/material.dart';

class GameScreen extends StatelessWidget {
  final String usernameLeft;
  final String scoreLeft;
  final String usernameRight;
  final String scoreRight;
  final String roundNumber;

  const GameScreen(
      {required this.usernameLeft,
      required this.scoreLeft,
      required this.usernameRight,
      required this.scoreRight,
      required this.roundNumber});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Runda: $roundNumber',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Pierwszy rząd z dwoma dużymi kontenerami
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Duży kontener z lewej
                  Container(
                    width: 150,
                    height: 200,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            usernameLeft,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              scoreLeft,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 150), // Odstęp między kontenerami
                  // Duży kontener z prawej
                  Container(
                    width: 150,
                    height: 200,
                    color: Colors.red,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Text(
                            usernameRight,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              scoreRight,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40), // Odstęp między rzędami
              // Drugi rząd z trzema małymi kontenerami
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Mały kontener 1
                  Container(
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
                  ),
                  const SizedBox(width: 20), // Odstęp między kontenerami
                  // Mały kontener 2
                  Container(
                    width: 130,
                    height: 50,
                    color: Colors.brown,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'przycisk 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20), // Odstęp między kontenerami
                  // Mały kontener 3
                  Container(
                    width: 130,
                    height: 50,
                    color: Colors.brown,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'przycisk 3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
