class Questions{
  Questions(this.questionText,this.answers);
  String questionText;
  List<String> answers;

  List<String> shuffleAnswers(){
    List<String> shuffled=List.of(answers);
    shuffled.shuffle();
    return shuffled;
  }
}