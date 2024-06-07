import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flame_game/bloc/game_bloc.dart';

class AnimationsWidget extends StatelessWidget {
  const AnimationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Flexible(
      child: SizedBox(
        width: size.width * 0.35,
        child: StreamBuilder(
          stream: context.read<GameBloc>().animationStream,
          builder: (context, snapshot) => snapshot.data ?? const SizedBox(),
        ),
      ),
    );
  }
}
