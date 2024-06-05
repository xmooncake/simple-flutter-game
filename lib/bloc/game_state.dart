// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_bloc.dart';

enum GameStatus { initial, win, lose }

class GameState extends Equatable {
  final GameStatus status;
  final int userScore;
  final int computerScore;

  const GameState({
    this.status = GameStatus.initial,
    this.userScore = 0,
    this.computerScore = 0,
  });

  GameState copyWith({
    GameStatus? status,
    int? userScore,
    int? computerScore,
  }) {
    return GameState(
      status: status ?? this.status,
      userScore: userScore ?? this.userScore,
      computerScore: computerScore ?? this.computerScore,
    );
  }

  @override
  List<Object?> get props => [status, userScore, computerScore];
}
