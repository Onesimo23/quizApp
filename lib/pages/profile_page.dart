// profile_page.dart
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uniquiz/models/question_model.dart';
import 'package:uniquiz/models/recent_quiz_model.dart';
import 'package:uniquiz/pages/question_data.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adicionar Nova Pergunta',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 10),
            QuestionForm(),
            SizedBox(height: 20),
            ],
        ),
      ),
    );
  }
}

class QuestionForm extends StatefulWidget {
  @override
  _QuestionFormState createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController optionsController = TextEditingController();
  final TextEditingController correctOptionController = TextEditingController();
  String selectedCategory = "Cultura geral"; // Valor padrão

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: questionController,
          decoration: InputDecoration(labelText: 'Pergunta'),
        ),
        SizedBox(height: 10),
        TextField(
          controller: optionsController,
          decoration: InputDecoration(
              labelText: 'Opções (separadas por vírgula)'),
        ),
        SizedBox(height: 10),
        TextField(
          controller: correctOptionController,
          decoration: InputDecoration(labelText: 'Opção Correta'),
        ),
        SizedBox(height: 10),
        DropdownButton<String>(
          value: selectedCategory,
          onChanged: (String? newValue) {
            setState(() {
              selectedCategory = newValue!;
            });
          },
          items: ["Cultura geral", "Educação Fisica", "Quimica"]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            addQuestionToDatabase();
          },
          child: Text('Adicionar Pergunta'),
        ),
      ],
    );
  }

  void addQuestionToDatabase() {
    final String question = questionController.text;
    final List<String> options = optionsController.text.split(',');
    final String correctOption = correctOptionController.text;

    final QuestionModel newQuestion = QuestionModel(
      question: question,
      options: options,
      correctOption: correctOption,
    );

   addCustomQuestion(newQuestion);

    // Limpar os controladores após adicionar a pergunta
    questionController.clear();
    optionsController.clear();
    correctOptionController.clear();
  }

  // Função para adicionar a pergunta à lista correspondente na página RecentQuiz
  void addCustomQuestion(QuestionModel question) {
    recentQuizzes.forEach((quiz) {
      if (quiz.questions.isEmpty) {
        quiz.questions.addAll(customQuestions);
      }
      quiz.questions.add(question);
    });
  }
}
