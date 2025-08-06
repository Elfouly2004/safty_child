import 'package:flutter/material.dart';
import '../models/question_model.dart';

class ReviewAnswersScreen extends StatelessWidget {
  final Map<String, dynamic> userAnswers;
  final List<QuestionModel> allQuestions;

  const ReviewAnswersScreen({
    Key? key,
    required this.userAnswers,
    required this.allQuestions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<_QuestionWithIndex> incorrectQuestions = [];

    userAnswers.forEach((key, answer) {
      if (key.startsWith('0_')) return; // تجاهل الأسئلة التعريفية

      final parts = key.split('_');
      if (parts.length != 2) return;

      final questionIndex = int.tryParse(parts[1]);
      if (questionIndex == null || questionIndex >= allQuestions.length) return;

      final question = allQuestions[questionIndex];

      if (!_answersMatch(answer, question.correctAnswer)) {
        incorrectQuestions.add(_QuestionWithIndex(key, question, answer));
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('مراجعة الأخطاء')),
      body: incorrectQuestions.isEmpty
          ? Center(child: Text('كل إجاباتك صحيحة!'))
          : ListView.builder(
        itemCount: incorrectQuestions.length,
        itemBuilder: (context, index) {
          final item = incorrectQuestions[index];
          return Card(
            margin: EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('السؤال:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(item.question.question),

                  SizedBox(height: 10),
                  Text('إجابتك:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    _formatAnswer(item.userAnswer, item.question),
                    style: TextStyle(color: Colors.red),
                  ),

                  SizedBox(height: 10),
                  Text('الإجابة الصحيحة:', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    _formatAnswer(item.question.correctAnswer, item.question),
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  bool _answersMatch(dynamic a, dynamic b) {
    if (a is List && b is List) {
      return a.length == b.length && a.toSet().containsAll(b);
    }
    return a.toString() == b.toString();
  }

  String _formatAnswer(dynamic answer, QuestionModel question) {
    if (answer is List) {
      return answer.map((i) => question.answers[i]).join(', ');
    } else if (answer is int) {
      return question.answers[answer];
    } else {
      return answer.toString();
    }
  }
}

class _QuestionWithIndex {
  final String id;
  final QuestionModel question;
  final dynamic userAnswer;

  _QuestionWithIndex(this.id, this.question, this.userAnswer);
}