import 'package:flumuttslimer/roles/student/features/quizes/models/question_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';
import 'package:get/get.dart';

class StudentQuizesController extends GetxController {
  List<QuizModel> quizes = [
    QuizModel(
        id: '1',
        teacher_id: '1',
        teacher_name: 'حمدي دياب',
        title: 'عقيدة',
        points: 40,
        questions: [
          QuestionModel(
            id: '1',
            quiz_id: '1',
            label: "السؤال السؤالي المتساءل عل  السؤال ؟",
            answer: "الجواب لصحيح",
            option1: "الخيار الأول الخارق",
            option2: "الخيار الثاني الخارق",
            option3: "الخيار الثالث الخارق",
          ),
          QuestionModel(
            id: '1',
            quiz_id: '1',
            label: "السؤال السؤالي المتساءل عل  السؤال ؟",
            answer: "الجواب لصحيح",
            option1: "الخيار الأول الخارق",
            option2: "الخيار الثاني الخارق",
            option3: "الخيار الثالث الخارق",
          ),
          QuestionModel(
            id: '1',
            quiz_id: '1',
            label: "السؤال السؤالي المتساءل عل  السؤال ؟",
            answer: "الجواب لصحيح",
            option1: "الخيار الأول الخارق",
            option2: "الخيار الثاني الخارق",
            option3: "الخيار الثالث الخارق",
          ),
        ]),
    QuizModel(
        id: '1',
        teacher_id: '1',
        teacher_name: 'حمدي دياب',
        title: 'عقيدة',
        questions: [
          QuestionModel(
            id: '1',
            quiz_id: '1',
            label: "السؤال السؤالي المتساءل عل  السؤال ؟",
            answer: "الجواب لصحيح",
            option1: "الخيار الأول الخارق",
            option2: "الخيار الثاني الخارق",
            option3: "الخيار الثالث الخارق",
          ),
        ]),
    QuizModel(
        id: '1',
        teacher_id: '1',
        teacher_name: 'حمدي دياب',
        title: 'عقيدة',
        questions: [
          QuestionModel(
            id: '1',
            quiz_id: '1',
            label: "السؤال السؤالي المتساءل عل  السؤال ؟",
            answer: "الجواب لصحيح",
            option1: "الخيار الأول الخارق",
            option2: "الخيار الثاني الخارق",
            option3: "الخيار الثالث الخارق",
          ),
        ])
  ];
  List<String>? quizAnswers;
  fillAnswersList(quizIndex) {
    quizAnswers = List.filled(quizes[quizIndex].questions!.length, '');
  }

  var quizIndex;
  int quizResult = 0;
  int currentQuestion = 0;
  List<String> options = [];

  selectAnswer(quistionIndex, option) {
    quizAnswers![quistionIndex] = option;
    update(['update_option']);
  }

  nextQuestion(quizIndex) {
    if (currentQuestion != quizes[quizIndex].questions!.length - 1) {
      currentQuestion++;
      update(['update_question']);
    }
  }

  previousQuestion(quizIndex) {
    if (currentQuestion <= quizes[quizIndex].questions!.length - 1) {
      currentQuestion--;
      update(['update_question']);
    }
  }

  checkAnswers() {
    for (var element in quizAnswers!) {
      if (element.isEmpty) {
        return false;
      }
    }
    return true;
  }

  calucateResult(quizIndex) {
    for (int i = 0; i < quizAnswers!.length; i++) {
      if (quizes[quizIndex].questions![i].correctAnswer == quizAnswers![i]) {
        quizResult++;
      }
    }
  }

  checkAnswerCorrect() {
    return quizAnswers![currentQuestion] ==
        quizes[quizIndex].questions![currentQuestion].correctAnswer;
  }

  checkTheCorrectOption(option) {
    return option ==
        quizes[quizIndex].questions![currentQuestion].correctAnswer;
  }

  resetValues() {
    currentQuestion = 0;
    options = [];
  }

  resetQuiz() {
    resetValues();
    quizes.removeAt(quizIndex);
    quizAnswers = [];
    quizIndex = null;
    quizResult = 0;
    update(['finish_quiz']);
  }
}
