import 'package:equatable/equatable.dart';

class Rating extends Equatable {
  final int score;
  final String? comment;

  const Rating({required this.score, this.comment});

  @override
  List<Object?> get props => [score, comment];
}