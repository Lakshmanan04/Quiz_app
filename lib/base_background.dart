import 'package:flutter/material.dart';


import 'package:marvel_quiz_app/data/quiz_questions.dart';
import 'package:marvel_quiz_app/result_widgets/result_screen.dart';
import 'package:marvel_quiz_app/start_screen.dart';
import 'package:marvel_quiz_app/questions_screen.dart';

class BaseBackgroundForScreens extends StatefulWidget {
  const BaseBackgroundForScreens({super.key});

  @override
  State<BaseBackgroundForScreens> createState(){
    return BaseBackgroundForScreensState();
  }
}

class BaseBackgroundForScreensState extends State<BaseBackgroundForScreens> {

  var current = 'start-screen';
  List<String> selectedAnswers=[];

  void restartQuiz(){
    selectedAnswers=[];
    setState(() {
      current = 'questions-screen';
    });
  }

  void saveSelectedAnswers(answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        current = 'result-screen';
      });
    }
  }

  void switchScreen(){
    setState(() {
      current = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;
    if(current == 'questions-screen'){
      currentScreen =  QuestionsScreen(saveSelectedAnswers);
    }
    else if(current == 'result-screen'){
      currentScreen = ResultScreen(selectedAnswers,restartQuiz);
    }
    else{
      currentScreen = StartScreen(switchScreen);
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 3, 21, 101),
            Color.fromARGB(255, 29, 32, 201)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: currentScreen,
    );
  }
}

