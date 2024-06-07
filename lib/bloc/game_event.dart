part of 'game_bloc.dart';

sealed class GameEvent {}

class GameStartedEvent extends GameEvent {}

class GameCheckEvent extends GameEvent {}

class GameRestartedEvent extends GameEvent {}
