import 'package:flutter/material.dart';

import 'package:marvel_quiz_app/data/quiz_questions.dart';
import 'package:marvel_quiz_app/result_widgets/summary.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.selectedAnswers, this.restartQuiz, {super.key});

  final void Function() restartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> summary() {
    List<Map<String, Object>> datasummary = [];
    for (int i = 0; i < questions.length; i++) {
      datasummary.add({
        'question_number': i,
        'question': questions[i].questionText,
        'selected_answer': selectedAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return datasummary;
  }

  @override
  Widget build(context) {
    var summarydata = summary();
    var correctAnswers = summarydata.where((data) {
      return data['selected_answer'] == data['correct_answer'];
    }).length;
    var total = questions.length;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswers out of $total questions correctly!',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            Summary(summarydata),
            TextButton.icon(
              onPressed: restartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
