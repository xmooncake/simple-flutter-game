import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:simple_flame_game/utilities/utilities.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame with KeyboardEvents {
  @override
  Color backgroundColor() => Colors.white;

  @override
  FutureOr<void> onLoad() async {
    await FlameAudio.loop('background.mp3');

    return super.onLoad();
  }
}
