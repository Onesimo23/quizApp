import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniquiz/models/question_model.dart';

class PreferencesController {
  final SharedPreferences preferences;
  PreferencesController(this.preferences);

  void saveQuestion(QuestionModel model){
    QuestionModel(
    question: "Qual é o país africano mais populoso?",
    correctOption : "Nigéria",
    options: ["Nigéria", "Egito", "Etiópia", "Tanzânia"],
  );
  }

}
