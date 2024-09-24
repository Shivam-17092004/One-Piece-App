import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onepiece_quiz/data/questions.dart';
import 'package:onepiece_quiz/models/answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.choosedAnswer, super.key});
  final void Function(String answer)choosedAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestion = questions;
  int currentIndex = 0;
  var activeNowScreen = "question-screen";

  void setIndex(String answer) {

    widget.choosedAnswer(answer);

    setState(() {
      currentIndex += 1;
    });


  }

  final currentLink = meriLinks;
  

  @override
  Widget build(context) {
    return Stack(
      children: [
        /*FadeInImage(
            fit: BoxFit.cover,
            placeholder: MemoryImage(
              kTransparentImage,
            ),
            image: const NetworkImage(
                "https://images.hdqwalls.com/download/one-piece-4k-2g-800x1280.jpg"),
            width: double.infinity,
            height: double.infinity,
          )*/
          Image.network(currentLink[currentIndex],fit: BoxFit.cover,width: double.infinity,height: double.infinity,),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child:Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "${currentIndex+1}) ${currentQuestion[currentIndex].questionText}",
                    style: GoogleFonts.laila(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ...currentQuestion[currentIndex].getShuffledAnswers().map((answer) => AnswerButton(buttonTap: (){
                    setIndex(answer);
                  }, answer: answer))
                ],
              ),
          ),
        ),
      ],
    );
  }
}
