import 'package:flutter/material.dart';
import 'package:uniquiz/models/competition_model.dart';
import 'package:uniquiz/models/question_model.dart'; // Importe o modelo da pergunta

class CompetitionPage extends StatefulWidget {
  final CompetitionModel competitionModel;

  const CompetitionPage({Key? key, required this.competitionModel}) : super(key: key);

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  int currentQuestionIndex = 0;
  late List<Question> questionsForPlayer1;
  late List<Question> questionsForPlayer2;
  List<String> player1Answers = List.filled(10, '');
  List<String> player2Answers = List.filled(10, '');

  @override
  void initState() {
    super.initState();

    // Inicialize as listas de perguntas para os jogadores
    questionsForPlayer1 = _getRandomQuestions();
    questionsForPlayer2 = _getRandomQuestions();
  }

  // Função para obter 10 perguntas aleatórias
  List<Question> _getRandomQuestions() {
    List<Question> questions = [
      Question(
        question: 'Qual é a capital da França?',
        options: ['Londres', 'Madrid', 'Paris', 'Berlim'],
        correctOption: 'Paris',
      ),
      Question(
        question: 'Quem escreveu "Dom Casmurro"?',
        options: ['Machado de Assis', 'Carlos Drummond de Andrade', 'Cecília Meireles', 'José de Alencar'],
        correctOption: 'Machado de Assis',
      ),
      Question(
        question: 'Qual é o maior planeta do sistema solar?',
        options: ['Vênus', 'Júpiter', 'Marte', 'Saturno'],
        correctOption: 'Júpiter',
      ),
      Question(
        question: 'Em que ano ocorreu a Independência do Brasil?',
        options: ['1808', '1822', '1889', '1922'],
        correctOption: '1822',
      ),
      Question(
        question: 'Qual é o segundo idioma mais falado no mundo?',
        options: ['Espanhol', 'Mandarim', 'Hindi', 'Inglês'],
        correctOption: 'Espanhol',
      ),
      Question(
        question: 'Quem pintou a "Mona Lisa"?',
        options: ['Vincent van Gogh', 'Leonardo da Vinci', 'Pablo Picasso', 'Claude Monet'],
        correctOption: 'Leonardo da Vinci',
      ),
      Question(
        question: 'Qual é o símbolo químico do ouro?',
        options: ['Au', 'Ag', 'Fe', 'Cu'],
        correctOption: 'Au',
      ),
      Question(
        question: 'Quem foi o primeiro presidente do Brasil?',
        options: ['Getúlio Vargas', 'Juscelino Kubitschek', 'Deodoro da Fonseca', 'Tancredo Neves'],
        correctOption: 'Deodoro da Fonseca',
      ),
      Question(
        question: 'Qual é a capital do Japão?',
        options: ['Bangcoc', 'Seul', 'Tóquio', 'Pequim'],
        correctOption: 'Tóquio',
      ),
      Question(
        question: 'Quem escreveu "Memórias Póstumas de Brás Cubas"?',
        options: ['Eça de Queirós', 'Mário de Andrade', 'José Saramago', 'Machado de Assis'],
        correctOption: 'Machado de Assis',
      ),
    ];

    questions.shuffle();
    return questions.sublist(0, 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Competição'),
      ),
      body: Column(
        children: [
          // Exibir informações sobre os jogadores, pontuações, etc.
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.competitionModel.player1Name} - Score: ${player1Answers.where((a) => a.isNotEmpty).length}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  '${widget.competitionModel.player2Name} - Score: ${player2Answers.where((a) => a.isNotEmpty).length}',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Chances: ${10 - currentQuestionIndex}',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 11),
         if (currentQuestionIndex < 10) _buildPlayer1Questions(),
          if (currentQuestionIndex < 10) _buildPlayer2Questions(),
          if (currentQuestionIndex == 10) _buildResultsButtons(),
        ],
      ),
    );
  }

  // ...

Widget _buildPlayer1Questions() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Largura máxima
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              questionsForPlayer1[currentQuestionIndex].question,
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(height: 16),
          // Adicione opções aqui para o jogador 1
          for (String option in questionsForPlayer1[currentQuestionIndex].options)
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 49, 49, 49),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
              onPressed: () {
                setState(() {
                  player1Answers[currentQuestionIndex] = option;
                });
              },
              child: Text(
              option,
              style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
    ),
  );
}

Widget _buildPlayer2Questions() {
  if (player1Answers[currentQuestionIndex].isEmpty) {
    // Player 2 não pode responder até que Player 1 escolha uma opção
    return Container(); // Container vazio
  } else {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Largura máxima
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                questionsForPlayer2[currentQuestionIndex].question,
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 16),
            // Adicione opções aqui para o jogador 2
            for (String option in questionsForPlayer2[currentQuestionIndex].options)
             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 49, 49, 49),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
                onPressed: () {
                  setState(() {
                    player2Answers[currentQuestionIndex] = option;
                    _checkAndAdvance();
                  });
                },
                child: Text(
                  option,
                  style: TextStyle(color: Colors.white),
                  ),
              ),
          ],
        ),
      ),
    );
  }
}

// ...


Widget _buildResultsButtons() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          elevation: 0, // Remover efeito de pressionar
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Remover raio
          ),
        ),
        onPressed: () {
          showResults();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0), // Adicionar um espaçamento interno
          child: Text('Mostrar Resultados',  style: TextStyle(color: Colors.white),),
        ),
      ),
      SizedBox(height: 16), // Adicionar um espaçamento vertical
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          resetGame();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Recomeçar', style: TextStyle(color: Colors.white),),
        ),
      ),
      SizedBox(height: 16),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 58, 58, 58),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () {
          Navigator.pop(context); // Voltar à tela inicial
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'Voltar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

  // Função para verificar se ambos os jogadores escolheram uma opção e avançar
  void _checkAndAdvance() {
    if (player1Answers[currentQuestionIndex].isNotEmpty && player2Answers[currentQuestionIndex].isNotEmpty) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  // Função para exibir os resultados
  void showResults() {
    int player1Score = 0;
    int player2Score = 0;

    // Lógica para verificar respostas e atribuir pontuações
    for (int i = 0; i < 10; i++) {
      if (player1Answers[i] == questionsForPlayer1[i].correctOption) {
        player1Score++;
      }

      if (player2Answers[i] == questionsForPlayer2[i].correctOption) {
        player2Score++;
      }
    }

    // Exiba os resultados em um AlertDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Resultados'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${widget.competitionModel.player1Name} Pontuação: $player1Score'),
              Text('${widget.competitionModel.player2Name} Pontuação: $player2Score'),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 58, 58, 58)),
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: Text('Recomeçar'),
            ),
          ],
        );
      },
    );
  }

  // Função para reiniciar o jogo
  void resetGame() {
    setState(() {
      currentQuestionIndex = 0;
      player1Answers = List.filled(10, '');
      player2Answers = List.filled(10, '');
      questionsForPlayer1 = _getRandomQuestions();
      questionsForPlayer2 = _getRandomQuestions();
    });
  }
}

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
