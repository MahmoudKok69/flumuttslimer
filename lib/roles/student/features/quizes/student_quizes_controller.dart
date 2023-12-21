import 'package:flumuttslimer/roles/student/features/quizes/models/my_quiz_model.dart';
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
  ];
  List<MyQuizModel> my_quizes = [
    MyQuizModel(
      teacher_name: 'Miguel Cox',
      quiz_name: 'Ethan',
      result: 18.389,
      id: '3',
    ),
    MyQuizModel(
      teacher_name: 'Joshua Mills',
      quiz_name: 'Adrian',
      result: 11.3621,
      id: '1',
    ),
    MyQuizModel(
      teacher_name: 'Fred Jenkins',
      quiz_name: 'Maurice',
      result: 2.0018,
      id: '3',
    ),
    MyQuizModel(
      teacher_name: 'Maria Lee',
      quiz_name: 'Leila',
      result: 16.2708,
      id: '1',
    ),
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
