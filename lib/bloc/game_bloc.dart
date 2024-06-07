import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameState()) {
    on<GameStartedEvent>(
      (event, emit) => emit(state.copyWith(status: GameStatus.initial)),
    );
    on<GameCheckEvent>(
      (event, emit) async {
        _animationSink.add(
          Container(
            color: Colors.black,
            width: 100,
            height: 100,
          ),
        );

        await Future.delayed(const Duration(seconds: 1));

        _animationSink.add(
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        );
      },
    );
  }

  final _streamController = StreamController<Widget>();

  Stream<Widget> get animationStream => _streamController.stream;
  Sink<Widget> get _animationSink => _streamController.sink;
}
