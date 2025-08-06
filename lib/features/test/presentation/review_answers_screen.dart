import 'package:flutter/material.dart';
import '../models/labeled_question.dart';

class ReviewAnswersScreen extends StatelessWidget {
  final Map<String, dynamic> userAnswers;
  final List<LabeledQuestion> allQuestions;

  const ReviewAnswersScreen({
    super.key,
    required this.userAnswers,
    required this.allQuestions,
  });

  List<int> ensureList(dynamic value) {
    if (value is List) {
      return value.cast<int>();
    } else if (value is int) {
      return [value];
    } else {
      return [];
    }
  }

  String formatAnswerList(dynamic indices, List<String> options) {
    final List<int> indexList = ensureList(indices);
    return indexList.map((i) {
      if (i >= 0 && i < options.length) {
        return options[i];
      }
      return "غير معروف";
    }).join("، ");
  }

  @override
  Widget build(BuildContext context) {
    final List<LabeledQuestion> wrongQuestions = allQuestions.where((labeled) {
      final userAnswer = userAnswers[labeled.id];
      final correctAnswer = labeled.question.correctAnswer;

      debugPrint("🔍 ${labeled.id}: ${labeled.question.question}");
      debugPrint("   ✅ Correct: $correctAnswer");
      debugPrint("   🟥 User: $userAnswer");

      if (userAnswer == null) return true;

      final userList = Set.from(ensureList(userAnswer));
      final correctList = Set.from(ensureList(correctAnswer));

      final isCorrect = userList.length == correctList.length &&
          userList.containsAll(correctList);

      debugPrint("   🎯 IsCorrect: $isCorrect");

      return !isCorrect;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('مراجعة إجاباتك')),
      body: wrongQuestions.isEmpty
          ? const Center(child: Text("كل إجاباتك صحيحة، أحسنت! 🎉"))
          : CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final labeled = wrongQuestions[index];
                final question = labeled.question;
                final userAnswer = userAnswers[labeled.id];
                final userList = ensureList(userAnswer);
                final correctList = ensureList(question.correctAnswer);

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${index + 1}. ${question.question}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'إجابتك: ${formatAnswerList(userList, question.answers)}',
                          style: const TextStyle(color: Colors.red),
                        ),
                        Text(
                          'الإجابة الصحيحة: ${formatAnswerList(correctList, question.answers)}',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: wrongQuestions.length,
            ),
          ),
        ],
      ),
    );
  }
}