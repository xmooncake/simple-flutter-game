import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif/gif.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required GifController controller,
  })  : _gifController = controller,
        super(const GameState()) {
    on<GameStartedEvent>(
      (event, emit) => emit(state.copyWith(status: GameStatus.initial)),
    );
    on<GameCheckEvent>(
      (event, emit) async {
        await _playGif('assets/gifs/fight.gif');
        await _playGif('assets/gifs/dice.gif');
      },
    );
  }

  final GifController _gifController;
  final _streamController = StreamController<Widget>();

  Stream<Widget> get animationStream => _streamController.stream;
  Sink<Widget> get _animationSink => _streamController.sink;

  Future<void> _playGif(String path) async {
    _animationSink.add(
      Gif(
        image: AssetImage(path),
        controller: _gifController,
        onFetchCompleted: () {},
      ),
    );

    _gifController.reset();

    await _gifController.forward();

    _animationSink.add(const SizedBox());

    _gifController.reset();
  }

  @override
  Future<void> close() {
    _streamController.close();
    return super.close();
  }
}
