import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uniquiz/models/question_model.dart';

class RecentQuizModel {
  final String name;
  final IconData icon;
  final int totalQuestions;
  final int answeredQuestions;
  final List<QuestionModel> questions;

  RecentQuizModel({
    required this.name,
    required this.icon,
    required this.totalQuestions,
    required this.answeredQuestions,
    required this.questions,
  });
}

List<RecentQuizModel> recentQuizzes = [
  RecentQuizModel(
    name: "Cultura geral",
    icon: CupertinoIcons.globe,
    totalQuestions: 10,
    answeredQuestions: 10,
    questions: generateQuestionsForCategory("Cultura geral"),
  ),
  RecentQuizModel(
    name: "Educação Fisica",
    icon: CupertinoIcons.sportscourt,
    totalQuestions: 10,
    answeredQuestions: 10,
    questions: generateQuestionsForCategory("Educação Fisica"),
  ),
  RecentQuizModel(
    name: "Quimica",
    icon: CupertinoIcons.flame,
    totalQuestions: 10,
    answeredQuestions: 10,
    questions: generateQuestionsForCategory("Quimica"),
  ),
];

List<QuestionModel> generateQuestionsForCategory(String categoryName) {
  List<QuestionModel> questions = [];

  switch (categoryName) {
    case "Cultura geral":
      questions.addAll(generateCulturaGeralQuestions());
      break;
    case "Educação Fisica":
      questions.addAll(generateEducacaoFisicaQuestions());
      break;
    case "Quimica":
      questions.addAll(generateQuimicaQuestions());
      break;
    // Adicione mais casos conforme necessário para outras categorias
  }

  return questions;
}
List<QuestionModel> generateCulturaGeralQuestions() {
  return [
     QuestionModel(
    question: "Qual é o país africano mais populoso?",
    correctOption : "Nigéria",
    options: ["Nigéria", "Egito", "Etiópia", "Tanzânia"],
  ),
  QuestionModel(
    question: "Qual é a língua mais falada na África?",
    correctOption : "Árabe",
    options: ["Árabe", "Swahili", "Hausa", "Igbo"],
  ),
  QuestionModel(
    question: "Qual é o continente com o maior número de países?",
    correctOption : "África",
    options: ["África", "Ásia", "América do Norte", "América do Sul"],
  ),
  QuestionModel(
    question: "Qual é o país africano com a maior economia?",
    correctOption : "Nigéria",
    options: ["Nigéria", "África do Sul", "Egito", "Argélia"],
  ),
  QuestionModel(
    question: "Qual é o país africano com a maior população jovem?",
    correctOption : "Níger",
    options: ["Níger", "Chade", "Somália", "Sudão do Sul"],
  ),
  QuestionModel(
    question: "Qual é o país africano com a maior biodiversidade?",
    correctOption : "Congo",
    options: ["Congo", "Quênia", "Madagascar", "África do Sul"],
  ),
  QuestionModel(
    question: "Qual é o país africano com o maior número de vencedores do Prêmio Nobel?",
    correctOption : "África do Sul",
    options: ["África do Sul", "Etiópia", "Quênia", "Nigéria"],
  ),
  QuestionModel(
    question: "Qual é o país africano com o maior número de medalhas olímpicas?",
    correctOption : "África do Sul",
    options: ["África do Sul", "Nigéria", "Etiópia", "Quênia"],
  ),
  QuestionModel(
    question: "Qual é o país africano com o maior número de startups de tecnologia?",
    correctOption : "Nigéria",
    options: ["Nigéria", "África do Sul", "Egito", "Quênia"],
  ),
  QuestionModel(
    question: "Qual é o país africano com a maior população de usuários de internet?",
    correctOption : "Nigéria",
    options: ["Nigéria", "África do Sul", "Egito", "Quênia"],
  ),
  ];
}

List<QuestionModel> generateEducacaoFisicaQuestions() {
  return [
    QuestionModel(
      question: "Qual é o maior osso do corpo humano?",
      correctOption : "Fêmur",
      options: ["Tíbia", "Fíbula", "Fêmur", "Úmero"],
    ),
    QuestionModel(
      question: "Quantos jogadores compõem um time de futebol?",
      correctOption : "11",
      options: ["9", "11", "13", "15"],
    ),
    QuestionModel(
      question: "Em que esporte se usa uma raquete para rebater uma peteca?",
      correctOption : "Badminton",
      options: ["Tênis", "Badminton", "Pingue-pongue", "Squash"],
    ),
    QuestionModel(
      question: "Qual é o nome do principal músculo responsável pela respiração?",
      correctOption : "Diafragma",
      options: ["Abdômen", "Peitoral", "Diafragma", "Traqueia"],
    ),
    QuestionModel(
      question: "Qual é a modalidade esportiva que se pratica no gelo com uma bola e tacos?",
      correctOption : "Hóquei no Gelo",
      options: ["Curling", "Patinagem Artística", "Hóquei no Gelo", "Bobsleigh"],
    ),
  ];
}

List<QuestionModel> generateQuimicaQuestions() {
  return [
    QuestionModel(
      question: "Qual é o símbolo químico do ouro?",
      correctOption : "Au",
      options: ["Ag", "Fe", "Cu", "Au"],
    ),
    QuestionModel(
      question: "Quantos elementos químicos existem na tabela periódica?",
      correctOption : "118",
      options: ["92", "103", "118", "124"],
    ),
    QuestionModel(
      question: "O que é pH?",
      correctOption : "Medida de acidez ou basicidade",
      options: ["Pressão Hidrostática", "Potencial Hidrogeniônico", "Medida de acidez ou basicidade", "Período Hidrodinâmico"],
    ),
    QuestionModel(
      question: "Qual é o gás mais abundante na atmosfera terrestre?",
      correctOption : "Nitrogênio",
      options: ["Oxigênio", "Dióxido de Carbono", "Hidrogênio", "Nitrogênio"],
    ),
    QuestionModel(
      question: "O que é uma reação endotérmica?",
      correctOption : "Absorve calor",
      options: ["Libera calor", "Absorve calor", "Transforma em eletricidade", "Gera luz"],
    ),
  ];
}
