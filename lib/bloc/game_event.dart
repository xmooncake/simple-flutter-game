part of 'game_bloc.dart';

sealed class GameEvent {}

class GameContinuedEvent extends GameEvent {}

class GameCheckEvent extends GameEvent {}

class GameRestartedEvent extends GameEvent {}
