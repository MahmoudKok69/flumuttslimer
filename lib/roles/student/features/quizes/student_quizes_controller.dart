import 'package:flumuttslimer/roles/student/features/quizes/models/question_model.dart';
import 'package:flumuttslimer/roles/student/features/quizes/models/quiz_model.dart';

class StudentQuizesController {
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
}
