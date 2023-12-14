// competition_model.dart
import 'package:flutter/foundation.dart';

class Question {
  final String question;
  final List<String> options;
  final String correctOption; 

  Question({
    required this.question,
    required this.options,
    required this.correctOption,
  });
}

class CompetitionModel {
  final String player1Name;
  final String player2Name;

  int player1Score;
  int player2Score;

  CompetitionModel({
    required this.player1Name,
    required this.player2Name,
    this.player1Score = 0,
    this.player2Score = 0,
  });
}
