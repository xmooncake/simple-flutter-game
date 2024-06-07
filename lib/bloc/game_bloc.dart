import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';
import 'package:simple_flame_game/components/received_points.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required GifController controller,
  })  : _gifController = controller,
        super(const GameState()) {
    on<GameContinuedEvent>(
      (event, emit) async {
        emit(state.copyWith(status: GameStatus.animating));
        await _playGif('assets/gifs/dice.gif');

        final points = getRandomPoints();
        _animationSink.add(ReceivedPoints(receivedPoints: points));

        await Future.delayed(animationDuration);

        emit(
          state.copyWith(
            status: GameStatus.playing,
            currentRound: state.currentRound + 1,
            userScore: state.userScore + points,
            computerScore: state.computerScore + getRandomPoints(),
          ),
        );

        _resetAnimation;
      },
    );
    on<GameCheckEvent>(
      (event, emit) async {
        if (state.currentRound == 1) return;

        emit(state.copyWith(status: GameStatus.finished));
        await _playGif('assets/gifs/fight.gif');

        await Future.delayed(const Duration(milliseconds: 500));

        print('${state.userScore}, ${state.computerScore}');
        if (state.userScore >= state.computerScore) {
          await _playGif('assets/gifs/win.gif');
        } else {
          await _playGif('assets/gifs/lose.gif');
        }

        emit(state.copyWith(status: GameStatus.finished));
      },
    );
    on<GameRestartedEvent>(
      (event, emit) => emit(const GameState()),
    );
  }

  final GifController _gifController;
  final _streamController = StreamController<Widget>();

  Stream<Widget> get animationStream => _streamController.stream;
  Sink<Widget> get _animationSink => _streamController.sink;

  Future<void> _playGif(String path) async {
    _animationSink.add(
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Gif(
          fit: BoxFit.fill,
          duration: animationDuration,
          image: AssetImage(path),
          controller: _gifController,
        ),
      ),
    );

    _gifController.reset();

    await _gifController.animateTo(1, duration: animationDuration);

    _resetAnimation;
  }

  int getRandomPoints() {
    return Random().nextInt(10);
  }

  void get _resetAnimation => _animationSink.add(const SizedBox());

  static const Duration animationDuration = Duration(seconds: 4);

  String get computerScoreApproximation {
    if (state.currentRound == 1) return '??';

    final int low = (state.computerScore * 0.75124).round();
    final int high = (state.computerScore * 1.25341325).round();
    return '$low - $high';
  }

  @override
  Future<void> close() {
    _streamController.close();
    return super.close();
  }
}
