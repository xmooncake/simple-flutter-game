import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flutter_game/bloc/game_bloc.dart';
import 'package:simple_flutter_game/components/game_button.dart';

class ControlsRow extends StatelessWidget {
  const ControlsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GameButton(
              icon: Icons.play_arrow,
              label: 'Kontynuuj',
              onPressed: () => context.read<GameBloc>().add(
                    GameContinuedEvent(),
                  ),
              isDisabled: state.status != GameStatus.playing,
            ),
            GameButton(
              icon: Icons.swap_horiz_outlined,
              label: 'Sprawdzam',
              onPressed: () => context.read<GameBloc>().add(
                    GameCheckEvent(),
                  ),
              isDisabled: state.status != GameStatus.playing,
            ),
            GameButton(
              icon: Icons.refresh,
              label: 'Restart',
              onPressed: () => context.read<GameBloc>().add(
                    GameRestartedEvent(),
                  ),
              isDisabled: state.status == GameStatus.animating,
            ),
          ],
        );
      },
    );
  }
}
