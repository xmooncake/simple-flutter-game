part of 'game_bloc.dart';

enum GameStatus { initial, rollDice, gameEnd, win, lose }

class GameState extends Equatable {
  const GameState({
    this.status = GameStatus.initial,
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
  List<Object?> get props => [status, userScore, computerScore];
}
