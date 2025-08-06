import 'package:safty_children/features/test/data/questions%20stage/stage_four_questions.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_thee_questions.dart';
import 'package:safty_children/features/test/data/questions%20stage/stage_two_questions.dart';

import '../models/labeled_question.dart';



List<LabeledQuestion> getAllLabeledQuestions() {
  final List<LabeledQuestion> allQuestions = [];

  final stages = [
    stageTwoQuestions,   // stageIndex = 0
    stageThreeQuestions, // stageIndex = 1
    stageFourQuestions,  // stageIndex = 2
  ];

  for (int stageIndex = 0; stageIndex < stages.length; stageIndex++) {
    final questions = stages[stageIndex];
    for (int qIndex = 0; qIndex < questions.length; qIndex++) {
      allQuestions.add(
        LabeledQuestion(
          id: "${stageIndex}_$qIndex", // ✅ Fix here
          question: questions[qIndex],
        ),
      );
    }
  }

  return allQuestions;
}