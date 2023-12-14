import 'package:flutter/material.dart';
import 'package:uniquiz/models/question_model.dart';
import 'dart:async';

class QuestionPage extends StatefulWidget {
  const QuestionPage({
    Key? key,
    required this.title,
    required this.questions,
  }) : super(key: key);

  final String title;
  final List<QuestionModel> questions;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int currentQuestion = 0;
  final PageController _pageController = PageController();
  bool showCorrectAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Questões ${currentQuestion + 1}/${widget.questions.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.questions.length,
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    currentQuestion = index;
                    showCorrectAnswer =
                        false; // Reiniciar o indicador de resposta correta
                  });
                },
                itemBuilder: (context, index) {
                  final question = widget.questions[index];
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        widget.questions[index].question,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(height: 25),
                      ...List.generate(
                        question.options.length,
                        (optionIndex) {
                          final option = question.options[optionIndex];
                          final isAnswerCorrect = question.isCorrect(option);

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: RadioListTile(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 8.0,
                              ),
                              tileColor: showCorrectAnswer
                                  ? isAnswerCorrect
                                      ? Colors.green.withOpacity(0.5)
                                      : question.userAnswer == option
                                          ? Colors.red.withOpacity(0.5)
                                          : null
                                  : null,
                              title: Text(
                                option,
                              ),
                              selected: question.userAnswer == option,
                              value: option,
                              activeColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                              groupValue: question.userAnswer,
                              onChanged: (value) {
                                setState(() {
                                  widget.questions[index].userAnswer =
                                      value.toString();
                                });
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.maxFinite,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (currentQuestion < widget.questions.length - 1) {
                    setState(() {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      currentQuestion++;
                      showCorrectAnswer =
                          true; // Ativar o indicador de resposta correta
                      Timer(const Duration(seconds: 15), () {
                        setState(() {
                          showCorrectAnswer =
                              false; // Desativar o indicador após alguns segundos
                        });
                      });
                    });
                  } else {
                    // Lógica para exibir a notificação de pontuação
                    showScoreNotification();
                  }
                },
                child: Text(
                  currentQuestion < widget.questions.length - 1
                      ? "Proxima"
                      : "Submeter",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showScoreNotification() {
    int correctAnswers = 0;
    for (final question in widget.questions) {
      if (question.isCorrect(question.userAnswer)) {
        correctAnswers++;
      }
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Quiz Completado"),
        content: Text(
            "Você respondeu corretamente $correctAnswers das ${widget.questions.length} perguntas feitas."),
        actions: [
          TextButton(
            onPressed: () {
              // Navegar de volta à página inicial
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
