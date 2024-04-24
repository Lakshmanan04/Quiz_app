import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  const StartScreen(this.onTap,{super.key});

  final void Function() onTap;

  @override
  Widget build(context){
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/app_logo.png',
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 153, 11, 0),
          ),
          const Text(
              'Let\'s test the MarvelMadness in you',
              style: TextStyle(
              fontSize: 18,
              color:  Color.fromARGB(255, 218, 213, 213),
            ),
          ),
          TextButton.icon(
            onPressed: onTap,
            style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 218, 213, 213),
            ),
            icon:const Icon(Icons.arrow_right_alt),
            label: const Text('Start quiz'),
          ),
        ],
      ),
    );
  }
}