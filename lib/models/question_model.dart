class QuestionModel {
  final String question;
  final List<String> options;
  final String correctOption;
  final bool hasAnswered;
  String userAnswer;
  bool isCorrectAnswerMarked;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctOption,
    this.hasAnswered = false,
    this.userAnswer = "",
    this.isCorrectAnswerMarked = false,
  });

 bool isCorrect(String selectedOption) => correctOption == selectedOption;
}
