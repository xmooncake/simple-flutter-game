import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_flame_game/bloc/game_bloc.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({
    this.isUser = false,
  });

  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Flexible(
      child: Center(
        child: SizedBox(
          height: size.height * 0.4,
          width: size.width * 0.2,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    isUser ? 'Gracz' : 'Komputer',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: isUser ? Colors.green : Colors.red,
                        ),
                  ),
                  const SizedBox(height: 15),
                  const Text('Wynik: '),
                  const SizedBox(height: 5),
                  BlocBuilder<GameBloc, GameState>(
                    buildWhen: (previous, current) =>
                        previous.userScore != current.userScore ||
                        previous.computerScore != current.computerScore,
                    builder: (context, state) {
                      return Text(
                        (isUser ? state.userScore : state.computerScore)
                            .toString(),
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  getScoreString() {}
}
