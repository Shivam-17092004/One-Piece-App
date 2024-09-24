import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onepiece_quiz/data/questions.dart';
import 'package:onepiece_quiz/data/summary_data.dart';
import 'package:onepiece_quiz/screens/reward_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.finalTap, required this.gotMySummaryData, super.key});
  final List<Map<String, Object>> gotMySummaryData;
  final void Function() finalTap;
  @override
  Widget build(context) {
    final player = AudioPlayer();
    Widget reward = const SizedBox(
      height: 5,
    );
    var mySummary = gotMySummaryData;
    var numTotalQuestion = questions.length;
    var numcorrectQuestion = mySummary.where((data) {
      return data["correct_answer"] == data["user_answer"];
    }).length;

    if (numTotalQuestion == numcorrectQuestion) {
      reward = OutlinedButton(
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color.fromARGB(255, 211, 107, 10)),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const RewardScreen()));
                player.setReleaseMode(ReleaseMode.stop);
                player.play(AssetSource("rewards.mp3"));
          },
          child: Text(
              style: GoogleFonts.laila(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              "Open Treasure"));
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blueAccent,
          Colors.purpleAccent,
          Colors.lightBlue,
          Colors.deepPurpleAccent
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              textAlign: TextAlign.center,
              "You answered $numcorrectQuestion out of $numTotalQuestion questions correctly",
              style: GoogleFonts.laila(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 50,
          ),
          SummarData(summaryData: gotMySummaryData),
          const SizedBox(
            height: 60,
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 29, 119),
                foregroundColor: Colors.white),
            onPressed: finalTap,
            label: Text(
                textAlign: TextAlign.center,
                style: GoogleFonts.laila(
                    fontWeight: FontWeight.bold, fontSize: 20),
                "Restart Quiz "),
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(
            height: 10,
          ),
          reward
        ],
      ),
    );
  }
}
