import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:simple_flame_game/game.screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FlameAudio.loop('background.mp3', volume: 0.5);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Scaffold(
        body: GameScreen(
          usernameLeft: '',
          scoreLeft: '',
          usernameRight: '',
          scoreRight: '',
          roundNumber: '',
        ),
      ),
    );
  }
}
