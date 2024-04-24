import 'package:flutter/material.dart';

import 'package:marvel_quiz_app/result_widgets/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.selectedAnswers,this.restartQuiz, {super.key});

  final void Function() restartQuiz;
  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return QuestionSummary(selectedAnswers, restartQuiz);
  }
}
