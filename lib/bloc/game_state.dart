part of 'game_bloc.dart';

enum GameStatus { playing, animating, finished }

class GameState extends Equatable {
  const GameState({
    this.status = GameStatus.playing,
    this.currentRound = 1,
    this.userScore = 0,
    this.computerScore = 0,
  });

  final GameStatus status;
  final int currentRound;
  final int userScore;
  final int computerScore;

  GameState copyWith({
    GameStatus? status,
    int? currentRound,
    int? userScore,
    int? computerScore,
  }) {
    return GameState(
      status: status ?? this.status,
      currentRound: currentRound ?? this.currentRound,
      userScore: userScore ?? this.userScore,
      computerScore: computerScore ?? this.computerScore,
    );
  }

  @override
  List<Object?> get props => [status, currentRound, userScore, computerScore];
}
