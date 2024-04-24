import 'package:flutter/material.dart';

import 'package:marvel_quiz_app/data/quiz_questions.dart';
import 'package:marvel_quiz_app/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelected, {super.key});

  final void Function(String answer) onSelected;

  @override
  State<QuestionsScreen> createState() {
    return QuestionsScreenState();
  }
}

class QuestionsScreenState extends State<QuestionsScreen> {
  int questionNumber = 0;

  void switchQuestion(answer) {
    widget.onSelected(answer);
    setState(() {
      questionNumber = questionNumber + 1;
    });
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[questionNumber].questionText,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...questions[questionNumber].shuffleAnswers().map((answer) {
              return AnswerButton(
                answer,
                () {
                  switchQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
