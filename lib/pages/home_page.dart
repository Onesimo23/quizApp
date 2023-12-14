// home_page.dart
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:uniquiz/models/live_quiz_model.dart';
import 'package:uniquiz/models/competition_model.dart';
import 'package:uniquiz/models/recent_quiz_model.dart';
import 'package:uniquiz/pages/competition_page.dart';
import 'package:uniquiz/pages/profile_page.dart'; // Importe a nova página do perfil
import 'package:uniquiz/widgets/live_quiz.dart';
import 'package:uniquiz/widgets/quiz_header.dart';
import 'package:uniquiz/widgets/recent_quiz.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const QuizHeader(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                    top: 25, left: 15, right: 15, bottom: 15),
                children: [
                  Text(
                    "Selecione a Disciplina",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 15),
                   ...List.generate(
                    recentQuizzes.length,
                    (index) {
                      return RecentQuiz(recentQuizModel: recentQuizzes[index]);
                    },
                  ),
                  const SizedBox(height: 25),
                  Text(
                    "Disciplinas em Ascensão",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(height: 15),
                  ...List.generate(
                    liveQuizzes.length,
                    (index) {
                      return LiveQuiz(liveQuizModel: liveQuizzes[index]);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Ionicons.home_outline),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.ribbon_outline),
            label: "Awards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Ionicons.person_outline),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            navigateToCompetitionPage(context);
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }

  void navigateToCompetitionPage(BuildContext context) {
    final competitionModel = CompetitionModel(
      player1Name: "Player 1",
      player2Name: "Player 2",
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CompetitionPage(competitionModel: competitionModel),
      ),
    );
  }
}
