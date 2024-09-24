import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:onepiece_quiz/data/questions.dart';
import 'package:onepiece_quiz/screens/question_screen.dart';
import 'package:onepiece_quiz/screens/result_screen.dart';
import 'package:onepiece_quiz/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  final player = AudioPlayer();
  List<String>chosenAnswer = [];
  var activeScreen = "start-screen";
 
  
  void currentScreen()async {
    setState(() {
      activeScreen = "question-screen";
    });

    /*final player = AudioPlayer();
    player.play(AssetSource("1.mp3"));*/
    await player.setReleaseMode(ReleaseMode.loop);
    player.play(AssetSource("song2.mp3"));

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player.setReleaseMode(ReleaseMode.stop);
    player.play(AssetSource("intro.mp3"));
  }

  void getCHoosedAnswer(String answer){

    setState(() {
    chosenAnswer.add(answer);
      
    });

    if(chosenAnswer.length == questions.length){
      activeScreen = "result-screen";
      player.stop();
    }
    
  }

  void finalEnd(){

    setState(() {
    activeScreen = "start-screen";
    chosenAnswer = [];
      
    });
  }

  List<Map<String, Object>>getSummaryData(){
    final List<Map<String, Object>>summary = [];
    for (var i = 0; i<chosenAnswer.length;i++){
      summary.add({
        "question_index" : i,
        "question" : questions[i].questionText,
        "correct_answer": questions[i].answers[0],
        "user_answer" : chosenAnswer[i],
      });
    }
    return summary;
  }


  @override
  Widget build(context) {
    Widget presentScreen =  StartScreen(myTap: currentScreen,);

    if(activeScreen == "question-screen"){
      presentScreen =  QuestionScreen(choosedAnswer: getCHoosedAnswer,);
    }
    if(activeScreen == "result-screen"){
      presentScreen =   ResultScreen(gotMySummaryData: getSummaryData(),finalTap: finalEnd,);
    }
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
          body: presentScreen
    ));
  }
}
