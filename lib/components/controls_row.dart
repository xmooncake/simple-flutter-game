import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flame_game/bloc/game_bloc.dart';
import 'package:simple_flame_game/components/game_button.dart';

class ControlsRow extends StatelessWidget {
  const ControlsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // GameButton(icon: Icons.play_arrow, label: 'Kontynuuj', onPressed:  , ),
        GameButton(
          icon: Icons.swap_horiz_outlined,
          label: 'Sprawdzam',
          onPressed: () => context.read<GameBloc>().add(
                GameCheckEvent(),
              ),
        ),
        GameButton(
          icon: Icons.refresh,
          label: 'Restart',
          onPressed: () => context.read<GameBloc>().add(
                GameRestartedEvent(),
              ),
        ),
      ],
    );
  }
}
