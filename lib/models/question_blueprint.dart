class QuizQuestion {
  const QuizQuestion(this.questionText,this.answers);
  final String questionText;
  final List<String>answers;
  
  List<String>getShuffledAnswers(){
    final shuffledAnswer = List.of(answers);
    shuffledAnswer.shuffle();
    return shuffledAnswer;
  }

}