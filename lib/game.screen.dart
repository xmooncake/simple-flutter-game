import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import 'package:simple_flame_game/bloc/game_bloc.dart';
import 'package:simple_flame_game/components/appbar_title.dart';
import 'package:simple_flame_game/components/controls_row.dart';
import 'package:simple_flame_game/components/players_row.dart';

class GameScreen extends StatefulWidget {
  const GameScreen();

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    gifController = GifController(vsync: this);
    super.initState();
  }

  late GifController gifController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(controller: gifController),
      child: Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            round: 1,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.grey[300],
        body: const SafeArea(
          minimum: EdgeInsets.all(24),
          child: Column(
            children: [
              Expanded(child: PlayersRow()),
              ControlsRow(),
            ],
          ),
        ),
      ),
    );
  }
}
