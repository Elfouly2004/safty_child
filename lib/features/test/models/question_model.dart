enum QuestionType { withoutPoints, withPoints }

class QuestionModel {
  final String question;
  final List<String> answers;
  final double point;
  final List<int> correctAnswer;
  final bool isMultiChoice;
  final QuestionType type;
  final int stage;
  final bool Function(Map<String, dynamic> previousAnswers)? visibilityCondition;

  QuestionModel({
    required this.question,
    required this.answers,
    this.point = 0.0,
    required this.correctAnswer,
    required this.isMultiChoice,
    required this.type,
    required this.stage,
    this.visibilityCondition,
  });
}