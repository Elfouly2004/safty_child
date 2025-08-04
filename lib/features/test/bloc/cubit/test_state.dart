abstract class TestState {}

class TestInitialState extends TestState {}

class NextQuestionState extends TestState {
  final int currentQuestionIndex;

  NextQuestionState(this.currentQuestionIndex);
}

class ChoiceAnswerState extends TestState {
  final Map<String, dynamic> userAnswers;

  ChoiceAnswerState({required this.userAnswers});
}

class StageChangedState extends TestState {
  final int currentStageIndex;

  StageChangedState(this.currentStageIndex);
}

class TestCompleteState extends TestState {
  final Map<String, dynamic> userAnswers;

  TestCompleteState({required this.userAnswers});
}

class ErrorState extends TestState {
  final String message;

  ErrorState(this.message);
}
