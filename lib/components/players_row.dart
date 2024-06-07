import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flame_game/bloc/game_bloc.dart';
import 'package:simple_flame_game/components/animations_widget.dart';
import 'package:simple_flame_game/components/player_card.dart';

class PlayersRow extends StatelessWidget {
  const PlayersRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        PlayerCard(
          isUser: true,
        ),
        AnimationsWidget(),
        PlayerCard(),
      ],
    );
  }
}
