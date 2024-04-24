import 'package:flutter/material.dart';

import 'package:marvel_quiz_app/base_background.dart';

void main() {
  runApp(const Base());
}

class Base extends StatelessWidget {
  const Base({super.key});
  @override
  Widget build(context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BaseBackgroundForScreens(),
      ),
    );
  }
}
