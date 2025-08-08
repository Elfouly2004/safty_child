import 'question_model.dart';

class LabeledQuestion {
  final String id;
  final QuestionModel question;

  LabeledQuestion({

    required this.question,
    required this.id,
  });
}